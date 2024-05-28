// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeartured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeartured,
  });

  //? Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeartured: false);

  //? Convert model to Json structure so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeartured
    };
  }

  //? Map Json oriented docment snapshot from firebase to userModel
  factory CategoryModel.fromSnapshoot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      //? Map Json to the model
      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? "",
          image: data['Image'] ?? "",
          parentId: data['ParentId'] ?? "",
          isFeartured: data['IsFeatured'] ?? false);
    } else {
      return CategoryModel.empty();
    }
  }
}
