import 'package:cwt_ecommerce/data/repositories/user/user_repository.dart';
import 'package:cwt_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:cwt_ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/helpers/network_manager.dart';
import 'package:cwt_ecommerce/utils/popups/full_screen_loader.dart';
import 'package:cwt_ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    firstName.text = userController.user.value.firstName;
  }

  void updateUserName() async {
    try {
      //? Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are updating your information...", TImages.loaderAnimation);

      //? check interner
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //? Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //? update usrs first in the firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      //? update the rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //? Remove loader
      TFullScreenLoader.stopLoading();

      //? show succes message
      TLoaders.successSnackBar(
          title: "Congratulations", message: "Yourname has been updated.");

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
