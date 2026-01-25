import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class ProductsCatGridBody extends StatelessWidget {
  const ProductsCatGridBody({
    super.key,
    required this.title,
    required this.iconData,
  });
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffE7F2FD),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Icon(iconData, color: Colors.blue),
          ),
          Spacer(),
          Text(title, style: AppTextStyles.bold14),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
