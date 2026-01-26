import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/presentation/views/widgets/details_container.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            '750,000 جنيه',
            style: AppTextStyles.extraBold20.copyWith(color: Colors.blue),
          ),
          subtitle: Text(
            'شقة تمليك عصرية في حي العليا',
            style: AppTextStyles.bold18,
          ),
          trailing: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE5E7EB)),
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF1F5F9),
            ),
            child: Text(
              'شقة تمليك',
              style: AppTextStyles.bold12.copyWith(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 10),
        Divider(color: Color(0xffE5E7EB)),
        SizedBox(height: 20),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: DetailsContainer(title: 'غرف', num: '5'),
            ),
            Expanded(
              child: DetailsContainer(title: 'دورات المياه', num: '2'),
            ),
            Expanded(
              child: DetailsContainer(title: 'المساحه', num: '120 م²'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text('الوصف', style: AppTextStyles.bold18),
        SizedBox(height: 8),
        Text(
          'شقة تمليك عصرية تقع في حي العليا، تتميز بتصميم داخلي حديث ومساحات واسعة. تحتوي على 5 غرف نوم و2 دورات مياه، مع مطبخ مجهز بالكامل وغرفة معيشة مريحة. تقع الشقة في موقع استراتيجي بالقرب من المرافق الحيوية مثل المدارس والمستشفيات والمراكز التجارية.',
          style: AppTextStyles.regular16.copyWith(color: Color(0xff475569)),
        ),
      ],
    );
  }
}
