import 'package:cwt_ecommerce/features/shop/models/product_model.dart';
import 'package:cwt_ecommerce/utils/constants/enums.dart';
import 'package:cwt_ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../data/repositories/product/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProduct = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedProduct();
  }

  Future<void> fetchFeaturedProduct() async {
    print("Fetch Featured Image");
    try {
      // show loader
      isLoading.value = true;

      //?fetch products
      final products = await productRepository.getFeaturedProducts();

      //?Assign Products
      featuredProduct.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //? Get the product price or piece range for variations.
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //if no variants exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      //? calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        //? Determian the price to consider (sale price if available, otherise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //? Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? calculateSalePercentage(double originPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originPrice <= 0) return null;

    double percentage = ((originPrice - salePrice) / originPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductsStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
