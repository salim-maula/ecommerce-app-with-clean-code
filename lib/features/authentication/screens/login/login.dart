import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:cwt_ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          
          children: [
            //? Logo, Title & Sub-Title
            const TLoginHeader() ,

            //?Form
            const TLoginForm(),

            //? Divider
            TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections),

            //? Footer
            const TSocialButtons()
          ],
        ),
      ),
    );
  }
}
