import 'package:cwt_ecommerce/data/repositories/categories/category_repository.dart';
import 'package:cwt_ecommerce/features/shop/models/category_model.dart';
import 'package:cwt_ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //? load category data
  Future<void> fetchCategories() async {
    try {
      //? Show loader
      isLoading.value = true;

      //?Fetch categories from data source (Firestore, API, etc)
      final categories = await _categoryRepository.getAllCategories();

      //? Update category list
      allCategories.assignAll(categories);

      //?Filter featured categories
      featuredCategories.assignAll(allCategories
          .where(
              (category) => category.isFeartured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh, Snap!', message: e.toString());
    } finally {
      //? Remove Loader
      isLoading.value = false;
    }
  }

  //? load selected category data

  //? get category or sub category products.
}
