import 'package:cwt_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:cwt_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/helpers/network_manager.dart';
import 'package:cwt_ecommerce/utils/popups/full_screen_loader.dart';
import 'package:cwt_ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //?Variable
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userContorller = Get.put(UserController());

  @override
  void onInit() {
    if (localStorage.read('REMEMBER_ME_EMAIL').toString() != "null" &&
        localStorage.read('REMEMBER_ME_PASSWORD').toString() != "null") {
      email.text = localStorage.read('REMEMBER_ME_EMAIL').toString();
      password.text = localStorage.read('REMEMBER_ME_PASSWORD').toString();
    }

    super.onInit();
  }

  //? Email and Password Signin
  Future<void> emailPasswordSignIn() async {
    try {
      //? Start Loading
      TFullScreenLoader.openLoadingDialog(
          "Loading you in...", TImages.loaderAnimation);

      //? Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //? Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //? Save Data if Remember me Is Selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //? Login user using EMail & Password Authenticaton
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmainlAndPassword(email.text.trim(), password.text.trim());

      //? Remove Loader
      TFullScreenLoader.stopLoading();

      //? Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "Loading you in ...", TImages.loaderAnimation);

      //? Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //? Google Authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      //? save user Record
      await userContorller.saveUserRecord(userCredential);

      //? Remove Loader
      TFullScreenLoader.stopLoading();

      //? Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
