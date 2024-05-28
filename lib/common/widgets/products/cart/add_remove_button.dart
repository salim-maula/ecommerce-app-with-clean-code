import 'package:cwt_ecommerce/common/widgets/icons/t_circular_icon.dart';
import 'package:cwt_ecommerce/utils/constants/colors.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:cwt_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantityWithAddRemovedButton extends StatelessWidget {
  const TProductQuantityWithAddRemovedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisSize: MainAxisSize.min,
     children: [
        TCircularIcon(
       icon: Iconsax.minus,
       width: 32,
       height: 32,
       size: TSizes.md,
       color: THelperFunctions.isDarkMode(context)
           ? TColors.white
           : TColors.black,
       backgroundColor: THelperFunctions.isDarkMode(context)
           ? TColors.darkGrey
           : TColors.light,
     ),
     const SizedBox(width: TSizes.spaceBtwItems,),
     Text('2', style: Theme.of(context).textTheme.titleSmall,),
     const SizedBox(width: TSizes.spaceBtwItems,),
      const TCircularIcon(
       icon: Iconsax.add,
       width: 32,
       height: 32,
       size: TSizes.md,
       color: TColors.white,
       backgroundColor: TColors.primary,
     ),
     ],
    );
  }
}