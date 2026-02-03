import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.title, this.isActive = false});
  final String title;

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE5E7EB)),
        borderRadius: BorderRadius.circular(9999),
        color: isActive ? Colors.blue : Colors.transparent,
      ),
      child: Row(
        spacing: 5,
        children: [
          Text(
            title,
            style: AppTextStyles.semiBold14.copyWith(
              color: isActive ? Colors.white : null,
            ),
          ),
          Icon(
            Icons.arrow_drop_down_rounded,
            color: isActive ? Colors.white : null,
          ),
        ],
      ),
    );
  }
}
