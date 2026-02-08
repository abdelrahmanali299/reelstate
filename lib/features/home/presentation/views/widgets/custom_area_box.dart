import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class CustomAreaBox extends StatelessWidget {
  const CustomAreaBox({super.key, required this.area});
  final double area;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Text(
        "${area.toInt()}",
        style: AppTextStyles.bold14.copyWith(color: Colors.blue),
      ),
    );
  }
}
