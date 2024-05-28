import 'package:cwt_ecommerce/common/widgets/images/t_rounded_image.dart';
import 'package:cwt_ecommerce/utils/constants/colors.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:cwt_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageurl: TImages.productImage20,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: TProductTitleText(title: "Black Sports shoes", maxLine: 1,)),
              //Attribute
              Text.rich(TextSpan(children:[
                TextSpan(text: 'color ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: 'UK 08 ', style: Theme.of(context).textTheme.bodyLarge),
              ] ))
            ],
          ),
        )
      ],
    );
  }
}