import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwt_ecommerce/data/services/firebase_storage_service.dart';
import 'package:cwt_ecommerce/utils/constants/enums.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  //? Firestore instance for database interaction
  final _db = FirebaseFirestore.instance;

  //?Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    print("Panggil Fungsi");
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      print("SEBELUM LIST");
      final list =
          snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      print(list);
      return list;
    } on FirebaseException catch (e) {
      print("ERROR");
      print(e.toString());
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
       print("ERROR");
      print(e.toString());
      throw TPlatformException(e.code).message;
    }
    //catch (e) {
    //   throw 'Something went wrong. Product canot load';
    // }
  }

  //? Upload dummy data to the cloud firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var product in products) {
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        product.thumbnail = url;

        //Product list of images
        if (product.images != null && product.images!.isEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);

            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        //Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            //? Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            //? Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            //? Assign URL to variation image attribute
            variation.image = url;
          }
        }

        //? Store product in firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
