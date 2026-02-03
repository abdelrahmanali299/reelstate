import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Text(
          message ?? 'حدث خطأ ما',
          style: AppTextStyles.bold16.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
