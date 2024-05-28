// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final bool active;
   String imageUrl;
  String targetScreen;

  BannerModel({
    required this.active,
    required this.imageUrl,
    required this.targetScreen,
  });
  static BannerModel empty() =>
      BannerModel( active: false, imageUrl: '', targetScreen: '');

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return BannerModel(
          active: data['Active'] ?? false,
          imageUrl: data['ImageUrl'] ?? " ",
          targetScreen: data['TargetScreen'] ?? "");
    } else {
      return BannerModel.empty();
    }
  }
}
