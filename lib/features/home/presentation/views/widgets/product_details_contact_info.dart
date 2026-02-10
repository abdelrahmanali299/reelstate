import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/presentation/views/widgets/product_details_contact.dart';

class ProductDetailsContactInfo extends StatelessWidget {
  const ProductDetailsContactInfo({super.key, required this.realestateModel});
  final RealestateModel realestateModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            IntrinsicWidth(child: ProductDetailsContact()),
            SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xffE5E7EB)),
                color: Color(0xffF1F5F9),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الموقع: ',
                    style: AppTextStyles.bold16.copyWith(color: Colors.grey),
                  ),
                  Flexible(
                    child: Text(
                      '${realestateModel.address?.country}, ${realestateModel.address?.state}, ${realestateModel.address?.city}, ${realestateModel.address?.street}',
                      style: AppTextStyles.bold14.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xffE5E7EB)),
                color: Color(0xffF1F5F9),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'رقم الاعلان: ${realestateModel.id}',
                    style: AppTextStyles.bold14.copyWith(color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    'تاريخ النشر : ${realestateModel.date?.day}/${realestateModel.date?.month}/${realestateModel.date?.year}',
                    style: AppTextStyles.bold14.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
