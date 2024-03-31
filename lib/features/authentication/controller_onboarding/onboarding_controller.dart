import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../screens/login/login.dart';

class OnBoadingController extends GetxController {
  static OnBoadingController get instance => Get.find();

  //? Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //? Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //? Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //? Update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //? update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
