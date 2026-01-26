import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/presentation/views/widgets/user_img.dart';

class ProductDetailsContact extends StatelessWidget {
  const ProductDetailsContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserImg(),
        SizedBox(width: 5),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text('عبدالرحمن', style: AppTextStyles.bold16),
              Text('وسيط معتمد', style: AppTextStyles.medium12),
            ],
          ),
        ),

        SizedBox(width: 5),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: Colors.blue),
            ),
            child: Icon(Icons.smartphone),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),

            child: Row(
              children: [
                SizedBox(width: 8),
                Expanded(
                  flex: 4,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'التحدث مع الوكيل',
                      style: AppTextStyles.bold16.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(child: Icon(Icons.chat_outlined, color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
