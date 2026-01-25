import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,
      child: Column(
        children: [
          SizedBox(height: 60),
          Image.asset('assets/images/sign in.png', width: 150, height: 150),
          Text(
            'Your gateway to modern living',
            style: AppTextStyles.regular14.copyWith(color: Color(0xff64748B)),
          ),
          const SizedBox(height: 26),
          const Text('Welcome Back', style: AppTextStyles.bold24),
          
        ],
      ),
    );
  }
}
