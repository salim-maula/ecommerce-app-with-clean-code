import 'package:cwt_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:cwt_ecommerce/data/repositories/user/user_repository.dart';
import 'package:cwt_ecommerce/features/authentication/model/user_model.dart';
import 'package:cwt_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/helpers/network_manager.dart';
import 'package:cwt_ecommerce/utils/popups/full_screen_loader.dart';
import 'package:cwt_ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //? Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //? SIGNUP

  void signup() async {
    try {
      //? start leading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.loaderAnimation);

      //? check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //? Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //?form validation
      if (!signupFormKey.currentState!.validate()) {
        //? Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //?privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                "in order to create account, you must have to read and accept the privacy policy & terms of us");
        return;
      }

      //?register user in the firebase authentiation
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //? save authenticator
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //? show success
      TLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your account have been created! Verivy email to continue.");

      //?move to ferivy email
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      //? Remove loader
      TFullScreenLoader.stopLoading();

      //? show some generic error
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
