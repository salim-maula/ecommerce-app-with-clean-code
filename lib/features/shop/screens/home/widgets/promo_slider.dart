import 'package:carousel_slider/carousel_slider.dart';
import 'package:cwt_ecommerce/common/widgets/custom_shapes/containers/circular_containers.dart';
import 'package:cwt_ecommerce/common/widgets/images/t_rounded_image.dart';
import 'package:cwt_ecommerce/features/shop/controllers/home_controller.dart';
import 'package:cwt_ecommerce/utils/constants/colors.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners
              .map((url) => TRoundedImage(imageurl: url))
              .toList(),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(() {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(right: 10),
                    backgroundColour: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
              ],
            );
          }),
        )
      ],
    );
  }
}
