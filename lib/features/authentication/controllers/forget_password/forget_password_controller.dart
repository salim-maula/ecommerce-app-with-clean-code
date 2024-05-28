import 'package:cwt_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:cwt_ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/helpers/network_manager.dart';
import 'package:cwt_ecommerce/utils/popups/full_screen_loader.dart';
import 'package:cwt_ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //? variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //? send reset password
  sendPasswordResetEmail() async {
    try {
      //? Start loading
      TFullScreenLoader.openLoadingDialog(
          "Processing your request..", TImages.loaderAnimation);

      //? Check conection internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //? Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //? send email to reset passwod
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //?remove loader
      TFullScreenLoader.stopLoading();

      //? Show success screen
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to Reset your passrd'.tr);

      //? Redirect
      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //? Start loading
      TFullScreenLoader.openLoadingDialog(
          "Processing your request..", TImages.loaderAnimation);

      //? Check conection internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //? send email to reset passwod
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      //?remove loader
      TFullScreenLoader.stopLoading();

      //? Show success screen
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to Reset your passrd'.tr);

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }
}
