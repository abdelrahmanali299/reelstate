import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('welcome back',style:AppTextStyles.bold24 ,),
      ],
    );
  }
}
