// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'brand_model.dart';
import 'product_attribute_model.dart';
import 'product_variants_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  String productType;
  List<String>? images;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  //? Create Emptyfunc for clean code
  static ProductModel empty() => ProductModel(
      id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

  Map<String, dynamic> toJson() {
    return {
      "SKU": sku,
      "Title": title,
      "Stock": stock,
      "Price": price,
      "Images": images ?? [],
      "Thumbnail": thumbnail,
      "SalePrice": salePrice,
      "IsFeatured": isFeatured,
      "CategoryId": categoryId,
      "Brand": brand!.toJson(),
      "Description": description,
      "ProductType": productType,
      "ProductAttributes": productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      "ProductVariations": productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : []
    };
  }

  //? Map Json oriented doc from firebase to model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? "",
      categoryId: data['CategoryId'] ?? "",
      description: data['Description'] ?? "",
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data["ProductAttributes"] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data["ProductVariations"] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
