class ProductAttributeModel {
  String? name;

  final List<String>? values;

  ProductAttributeModel({this.values, this.name});

  Map<String, dynamic>toJson() {
    return {'Name': name, 'Values': values};
  }

  //? Map JSON oriented doc snapshot from firebase to model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
