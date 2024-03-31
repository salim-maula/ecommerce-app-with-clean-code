import 'package:cwt_ecommerce/common/styles/spacing_styles.dart';
import 'package:cwt_ecommerce/features/authentication/screens/login/login.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:cwt_ecommerce/utils/constants/text_string.dart';
import 'package:cwt_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_string.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //? image
              Image(
                image:  AssetImage(image),
                width: THelperFunctions.screenWidth() * .6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //?title & sub title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //? Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => onPressed,
                  child: const Text(TTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
