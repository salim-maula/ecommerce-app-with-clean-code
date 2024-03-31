import 'package:cwt_ecommerce/common/widgets/login_signup/form_divider.dart';
import 'package:cwt_ecommerce/common/widgets/login_signup/social_buttons.dart';
import 'package:cwt_ecommerce/utils/constants/colors.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:cwt_ecommerce/utils/constants/text_string.dart';
import 'package:cwt_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //?TItle
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //? Form
             const TSignupForm(),

              const SizedBox(height: TSizes.spaceBtwSections),


              //? Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              //? Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

