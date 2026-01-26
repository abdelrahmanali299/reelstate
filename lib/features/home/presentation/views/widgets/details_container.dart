import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({super.key, required this.title, required this.num});
  final String title, num;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE5E7EB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(Icons.area_chart, color: Colors.blue),
          SizedBox(height: 8),
          Text(title, style: AppTextStyles.medium14),
          SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(num, style: AppTextStyles.bold20),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
