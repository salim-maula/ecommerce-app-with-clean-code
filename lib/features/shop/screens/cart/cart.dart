import 'package:cwt_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:cwt_ecommerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:cwt_ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
        
         
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=> Get.to(()=> const CheckoutScreen())
        ,child: const Text('Checkout \$250'),),
      ),
    );
  }
}
