import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwt_ecommerce/features/shop/models/banner_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //? variables
  final _db = FirebaseFirestore.instance;

  //? Get all order related to current user
  //? Get all catogories
  Future<List<BannerModel>> fetchBanner() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      // final list = snapshot.docs
      //     .map((document) => CategoryModel.fromSnapshoot(document))
      //     .toList();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching bannners';
    }
  }

  //? upload banner to the cloud firebase
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var banner in banners) {
        //? Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        //? Upload image and Get its URL
        final url =
            await storage.uploadImageData('Banners', file, banner.imageUrl);

        //? Assign URL to Category image attribute
        banner.imageUrl = url;

        await _db
            .collection('Banners')
            .add(banner.toJson());
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
