import 'package:cwt_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:cwt_ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:cwt_ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:cwt_ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimer/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controllers/product_controller.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
final controller = Get.put(ProductController());
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
                  const TSearchContainer(
                    text: 'Search in store',
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //?Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          onPressed: () => Get.to(() => const AllProducts()),
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        //? categories
                        const THomeCategory()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }

                    if (controller.featuredProduct.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found!',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProduct.length,
                      itemBuilder: (_, index) =>  TProductCardVertical(product: controller.featuredProduct[index],),
                    );
                  })
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
