import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

import 'package:reelstate/core/utils/widgets/custom_text_button.dart';
import 'package:reelstate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:reelstate/features/auth/presentation/view/sign_up_view.dart';
import 'package:reelstate/features/auth/presentation/view/widgets/signin_text_fields_section.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  @override
  Widget build(BuildContext signIncontext) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Image.asset('assets/images/sign in.png', width: 150, height: 150),
            Text(
              'بوابتك نحو الحياه العصرية',
              style: AppTextStyles.regular14.copyWith(color: Color(0xff64748B)),
            ),
            const SizedBox(height: 26),
            const Text('مرحبا', style: AppTextStyles.bold24),
            SizedBox(height: 20),
            SigninTextFieldsSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ليس لديك حساب؟',
                  style: AppTextStyles.regular14.copyWith(
                    color: Color(0xff64748B),
                  ),
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: signIncontext.read<AuthCubit>(),
                          child: SignUpView(),
                        ),
                      ),
                    );
                  },
                  title: 'انشاء حساب ',
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
