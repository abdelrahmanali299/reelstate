import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class CustomTypeBox extends StatelessWidget {
  const CustomTypeBox({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(type, style: AppTextStyles.bold16),
    );
  }
}
