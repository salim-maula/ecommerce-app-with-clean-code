import 'package:cwt_ecommerce/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:cwt_ecommerce/utils/constants/image_string.dart';
import 'package:flutter/material.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImages.shoeIcon,
            title: "Shoe",
            onTap: () {},
          );
        },
      ),
    );
  }
}