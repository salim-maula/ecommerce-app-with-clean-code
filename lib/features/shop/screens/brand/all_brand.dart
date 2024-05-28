import 'package:cwt_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:cwt_ecommerce/common/widgets/brands/brand_card.dart';
import 'package:cwt_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:cwt_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: 'Brands', showActionButton: false,),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => const TBrandCard(showBorder: true))
            ],
          ),
        ),
      ),
    );
  }
}
