import 'package:cwt_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:cwt_ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:cwt_ecommerce/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:cwt_ecommerce/common/widgets/list_tile/user_profile_tile.dart';
import 'package:cwt_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:cwt_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:cwt_ecommerce/features/personalization/screens/address/address.dart';
import 'package:cwt_ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:cwt_ecommerce/features/personalization/screens/upload_data/upload_data.dart';
import 'package:cwt_ecommerce/features/shop/screens/order/order.dart';
import 'package:cwt_ecommerce/utils/constants/colors.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                TUserProfileTIle(
                  onPressed: () => Get.to(() => const ProfileScreen()),
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
                const TSectionHeading(
                  title: 'Account Setting',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TSettingMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Address',
                  subTitle: 'Set shopping delivery address',
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                TSettingMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subTitle: 'Add, remove products and move to checkout',
                  onTap: () {},
                ),
                TSettingMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subTitle: 'In Progress and completed Orders',
                  onTap: () => Get.to(() => const OrderScreen()),
                ),
                TSettingMenuTile(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subTitle: 'Withdraw balance to registered bank account',
                  onTap: () {},
                ),
                TSettingMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subTitle: 'list of all the discounted coupons',
                  onTap: () {},
                ),
                TSettingMenuTile(
                  icon: Iconsax.notification,
                  title: 'Notifications',
                  subTitle: 'set any kind of notifications message',
                  onTap: () {},
                ),
                TSettingMenuTile(
                  icon: Iconsax.security_card,
                  title: 'Account Privacy',
                  subTitle: 'manage data usage and connected account',
                  onTap: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TSectionHeading(
                  title: 'App Setting',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TSettingMenuTile(
                  icon: Iconsax.document_upload,
                  title: 'load Data',
                  subTitle: 'Upload Data to your cloud firebase',
                  onTap: ()=> Get.to(()=> const UploadData()),
                ),
                TSettingMenuTile(
                  icon: Iconsax.location,
                  title: 'Geolocation',
                  subTitle: 'Set recommendation based on location',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
                TSettingMenuTile(
                  icon: Iconsax.security_user,
                  title: 'safe mode',
                  subTitle: 'search result is safe for all ages',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
                TSettingMenuTile(
                  icon: Iconsax.image,
                  title: 'HD Image uality',
                  subTitle: 'Set image quality to be seen',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        AuthenticationRepository.instance.logout();
                      },
                      child: const Text('Log Out')),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections * 2.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
