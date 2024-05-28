import 'package:cwt_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:cwt_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){},),
        Text('Salim Maula', style: Theme.of(context).textTheme.bodyLarge,),
const SizedBox(width: TSizes.spaceBtwItems/2,),
        const Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('+62 213 1231 1231')
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: Text('South Nangka, Hayam 3423, WRF', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,))
          ],
        ),
      ],
    );
  }
}