import 'package:cwt_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:cwt_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:cwt_ecommerce/features/shop/models/product_model.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration:
              const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale']
              .map((options) => DropdownMenuItem(
                    value: options,
                    child: Text(options),
                  ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
        TGridLayout(itemCount: 4, itemBuilder: (_, index)=>  TProductCardVertical(product: ProductModel.empty(),))
      ],
    );
  }
}