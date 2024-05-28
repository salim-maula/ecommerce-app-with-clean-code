import 'package:cwt_ecommerce/features/shop/screens/cart/cart.dart';
import 'package:cwt_ecommerce/utils/constants/colors.dart';
import 'package:cwt_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.onPressed,
     this.iconColor, this.counterBgColor, this.counterTextCOlor,
  });

  final VoidCallback onPressed;
  final Color? iconColor, counterBgColor, counterTextCOlor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: ()=> Get.to(()=> const CartScreen()),
            icon: Icon(
              Iconsax.shopping_bag,
              color: dark ? TColors.white : TColors.black,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: counterBgColor ?? (dark ? TColors.black : TColors.black), borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
