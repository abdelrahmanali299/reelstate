import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custem_text_field.dart';
import 'package:reelstate/core/utils/widgets/custom_button.dart';
import 'package:reelstate/core/utils/widgets/custom_text_button.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            SizedBox(height: 20),
            CustomTextField(hint: 'Email', fillColor: Colors.white),
            const SizedBox(height: 20),
            CustomTextField(
              hint: 'Password',
              fillColor: Colors.white,
              isPassword: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              onTap: () {},
              title: 'sign in',
              color: Color(0xff11D4C4),
              titleColor: Colors.white,
            ),
            // const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: AppTextStyles.regular14.copyWith(
                    color: Color(0xff64748B),
                  ),
                ),
                CustomTextButton(
                  title: 'Sign up',
                  textColor: Color(0xff11D4C4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
