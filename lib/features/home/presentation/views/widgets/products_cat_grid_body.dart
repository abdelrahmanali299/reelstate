import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class ProductsCatGridBody extends StatelessWidget {
  const ProductsCatGridBody({
    super.key,
    required this.title,
    required this.img,
  });
  final String title;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffE7F2FD),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(img, fit: BoxFit.fill, width: double.infinity),
          ),
          Stack(
            children: [
              Text(
                textAlign: TextAlign.center,
                title,
                style: AppTextStyles.bold24.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.blue,
                ),
              ),
              Text(
                textAlign: TextAlign.center,

                title,
                style: AppTextStyles.bold24.copyWith(color: Colors.white),
              ),
            ],
          ),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}
