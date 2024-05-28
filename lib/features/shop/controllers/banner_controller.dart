import 'package:cwt_ecommerce/data/repositories/banners/banner_repository.dart';
import 'package:cwt_ecommerce/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  //? Variable
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
 final bannerRepo = Get.put(BannerRepository());
  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //? update page navigationanl dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  //? fetch banner
  Future<void> fetchBanners() async {
    try {
      //? Show loader
      isLoading.value = true;

     
      final banner = await bannerRepo.fetchBanner();

      //? Assign Banners
      banners.assignAll(banner);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh, Snap!', message: e.toString());
    } finally {
      //? Remove Loader
      isLoading.value = false;
    }
  }
}
