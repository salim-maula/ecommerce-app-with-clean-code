import 'package:cwt_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:cwt_ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:cwt_ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
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
                  THomeAppBar(),

                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //? Searchbar
                  TSearchContainer(
                    text: 'Search in store',
                  ),

                  SizedBox(
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
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        //? categories
                        THomeCategory()
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner1,
                      TImages.promoBanner1,
                    ],
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCardVertical(),
                  )
                ],
              ),
            ),

            // Body -- Tutorial
          ],
        ),
      ),
    );
  }
}
