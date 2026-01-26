import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custom_back_button.dart';
import 'package:reelstate/features/home/presentation/views/widgets/filter_item.dart';
import 'package:reelstate/features/home/presentation/views/widgets/product_grid.dart';

class TamleekViewBody extends StatelessWidget {
  const TamleekViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20),
        Stack(
          children: [
            Align(alignment: Alignment.centerRight, child: CustomBackButton()),
            Align(
              alignment: Alignment.center,
              child: Text('شقق تمليك', style: AppTextStyles.extraBold18),
            ),
          ],
        ),
        SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 12,
            children: [
              FilterItem(title: 'السعر', isActive: true),
              FilterItem(title: 'المساحة'),
              FilterItem(title: 'المكان'),
              FilterItem(title: 'المكان'),
              FilterItem(title: 'المكان'),
            ],
          ),
        ),
        SizedBox(height: 30),
        Text('245  نتايج', style: AppTextStyles.extraBold20),
        SizedBox(height: 16),
        Expanded(child: ProductGrid()),
      ],
    );
  }
}
