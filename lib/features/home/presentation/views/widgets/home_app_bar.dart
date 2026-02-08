import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/presentation/views/widgets/user_img.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserImg(),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحباً بك،',
              style: AppTextStyles.medium12.copyWith(color: Color(0xff64748B)),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('عبدالرحمن', style: AppTextStyles.bold18),
            ),
          ],
        ),
        Spacer(),
        Icon(Icons.notifications_outlined, size: 24),
      ],
    );
  }
}
