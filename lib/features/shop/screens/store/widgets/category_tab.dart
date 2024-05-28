import 'package:cwt_ecommerce/common/widgets/brands/brand_show_case.dart';
import 'package:cwt_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:cwt_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:cwt_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:cwt_ecommerce/features/shop/models/category_model.dart';
import 'package:cwt_ecommerce/features/shop/models/product_model.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TBrandShowCase(
                images: [TImages.sportIcon, TImages.clothIcon, TImages.toyIcon],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //? -- roducts
              TSectionHeading(
                title: "You might like",
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) =>  TProductCardVertical(product: ProductModel.empty(),)),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
