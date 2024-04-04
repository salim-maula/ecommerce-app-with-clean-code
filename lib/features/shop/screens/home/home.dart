import 'package:cwt_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:cwt_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:cwt_ecommerce/utils/constants/colors.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:cwt_ecommerce/utils/device/device_utility.dart';
import 'package:cwt_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/text_string.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                //? Appbar
                const THomeAppBar(),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //? Searchbar
                TSearchContainer(
                  text: 'Search in store',
                ),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //?Categories
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      //? categories
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return TVerticalImageText(
                              image: TImages.shoeIcon,
                              title: "Shoe",
                              onTap: () {},
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //? Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (THelperFunctions.isDarkMode(context)
                          ? TColors.black
                          : TColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: TColors.dark,
                ),
              ),
            ),
            //? Text
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
