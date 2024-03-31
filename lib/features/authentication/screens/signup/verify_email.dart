import 'package:cwt_ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:cwt_ecommerce/features/authentication/screens/login/login.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:cwt_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/text_string.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              //?Image
              Image(
                image: const AssetImage(TImages.deliverdEmailIlustration),
                width: THelperFunctions.screenWidth() * .6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //?title & sub title
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                "salim@support.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //? buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: TImages.staticSuccessIlustration,
                      title: TTexts.yourAccountCreatedTitle,
                      subTitle: TTexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(
                        () => LoginScreen(),
                      ),
                    ),
                  ),
                  child: const Text(TTexts.tContinue),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(TTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
