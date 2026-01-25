import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/user_img.png'),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning',
              style: AppTextStyles.medium12.copyWith(color: Color(0xff64748B)),
            ),
            Text('Ahmed Al-Saud', style: AppTextStyles.bold18),
          ],
        ),
        Spacer(),
        Icon(Icons.notifications_outlined, size: 24),
      ],
    );
  }
}
