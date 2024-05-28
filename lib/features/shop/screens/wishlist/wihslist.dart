import 'package:cwt_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:cwt_ecommerce/common/widgets/icons/t_circular_icon.dart';
import 'package:cwt_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:cwt_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:cwt_ecommerce/features/shop/models/product_model.dart';
import 'package:cwt_ecommerce/features/shop/screens/home/home.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to( HomeScreen()),
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 4, itemBuilder: (_, index)=>  TProductCardVertical(product: ProductModel.empty(),))
            ],
          ),
        ),
      ),
    );
  }
}
