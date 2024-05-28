import 'package:cwt_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:cwt_ecommerce/utils/constants/text_string.dart';
import 'package:cwt_ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controler = UserController.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Re-Authenticated User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controler.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //? Email
                TextFormField(
                  controller: controler.verifyEmail,
                  validator: TValidator.validateEmail,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Obx(
                  () => TextFormField(
                    obscureText: controler.hidePassword.value,
                    controller: controler.verifyPassword,
                    validator: (value) =>
                        TValidator.validatorEmptyText("Password", value),
                    decoration: InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controler.hidePassword.value =
                              !controler.hidePassword.value,
                          icon: const Icon(Iconsax.eye_slash),
                        )),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections,),

                //? Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()=> controler.reAuthehnticateEmailAndPasswordUser(), child: const Text('verify'),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
