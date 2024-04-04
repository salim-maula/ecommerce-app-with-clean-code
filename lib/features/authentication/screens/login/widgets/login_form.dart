import 'package:cwt_ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:cwt_ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:cwt_ecommerce/navigation_menu.dart';
import 'package:cwt_ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../password_configuration/forget_password.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //? email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            //? password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffix: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            //? Remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                    // onPressed: () => Get.to(() => const ForgetPassword()),
                    onPressed: () => Get.to(() =>  "ForgetPassword()" as Widget),
                    child: const Text(TTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            //? Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            //? Create Account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
