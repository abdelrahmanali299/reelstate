import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/presentation/views/widgets/custom_area_box.dart';
import 'package:reelstate/features/home/presentation/views/widgets/pick_location.dart';

class RequestRealestateLocationAndPriceInfo extends StatelessWidget {
  const RequestRealestateLocationAndPriceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          "📍 الموقع",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        PickLocation(),
        SizedBox(height: 20),

        Divider(),
        SizedBox(height: 20),

        Row(
          children: [
            const Icon(Icons.attach_money, color: Colors.blue),
            const SizedBox(width: 8),
            const Text("السعر", style: AppTextStyles.bold18),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [CustomAreaBox(area: 30), CustomAreaBox(area: 54)],
        ),

        RangeSlider(
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          values: RangeValues(30, 500),
          min: 20,
          max: 1000,
          divisions: 48,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
