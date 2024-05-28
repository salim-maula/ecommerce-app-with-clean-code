import 'package:cwt_ecommerce/data/dummy/dummy_data.dart';
import 'package:cwt_ecommerce/data/repositories/banners/banner_repository.dart';
import 'package:cwt_ecommerce/data/repositories/categories/category_repository.dart';
import 'package:cwt_ecommerce/data/repositories/product/product_repository.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tile/setting_menu_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class UploadData extends StatelessWidget {
  const UploadData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Upload Data',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(
                title: 'Main Record',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSettingMenuTile(
                icon: Iconsax.category,
                title: 'Upload Categories',
                subTitle: '',
                onTap: () {
                  CategoryRepository.instance
                      .uploadDummyData(TDummyData.categories);
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSettingMenuTile(
                icon: Iconsax.shop,
                title: 'Upload Brands',
                subTitle: '',
                onTap: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSettingMenuTile(
                icon: Iconsax.shopping_cart,
                title: 'Upload Product',
                subTitle: '',
                onTap: () {
                  ProductRepository.instance
                      .uploadDummyData(TDummyData.products);
                },
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSettingMenuTile(
                icon: Iconsax.image,
                title: 'Upload Banner',
                subTitle: '',
                onTap: () {
                  BannerRepository.instance.uploadDummyData(TDummyData.banners);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
