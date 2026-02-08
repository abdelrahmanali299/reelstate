import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custom_back_button.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/presentation/views/widgets/filter_widget.dart';
import 'package:reelstate/features/home/presentation/views/widgets/product_grid.dart';

class EgarViewBody extends StatelessWidget {
  const EgarViewBody({super.key, required this.realestates});
  final List<RealestateModel> realestates;
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
              child: Text('شقق ايجار', style: AppTextStyles.extraBold18),
            ),
          ],
        ),
        SizedBox(height: 24),
        FilterWidget(type: RealestateType.egar),
        SizedBox(height: 30),
        Text('${realestates.length}  نتايج', style: AppTextStyles.extraBold20),
        SizedBox(height: 16),
        Expanded(child: ProductGrid(realestates: realestates)),
      ],
    );
  }
}
