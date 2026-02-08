import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custem_text_field.dart';
import 'package:reelstate/core/utils/widgets/custom_button.dart';
import 'package:reelstate/core/utils/widgets/custom_text_button.dart';
import 'package:reelstate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:reelstate/features/auth/presentation/view/widgets/forgot_password_section.dart';

class SigninTextFieldsSection extends StatefulWidget {
  const SigninTextFieldsSection({super.key});

  @override
  State<SigninTextFieldsSection> createState() =>
      _SigninTextFieldsSectionState();
}

class _SigninTextFieldsSectionState extends State<SigninTextFieldsSection> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext signinContext) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text('البريد الالكتروني', style: AppTextStyles.semiBold14),
          ),
          CustomTextField(
            controller: emailController,
            hint: 'البريد الالكتروني',
            fillColor: Colors.white,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text('كلمة المرور', style: AppTextStyles.semiBold14),
          ),
          CustomTextField(
            controller: passwordController,
            hint: 'كلمة المرور',
            fillColor: Colors.white,
            isPassword: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider.value(
                      value: signinContext.read<AuthCubit>() ,
                      child: ForgotPasswordSection(
                        
                      ),
                    );
                  },
                );
              },
              title: 'نسيت كلمة المرور؟',
              textColor: Color(0xff11D4C4),
            ),
          ),
          SizedBox(height: 10),
          CustomButton(
            onTap: () {
              signInSubmit(context);
            },
            borderColor: Color(0xff11D4C4),
            title: 'تسجيل الدخول',
            color: Color(0xff11D4C4),
            titleColor: Colors.white,
          ),
        ],
      ),
    );
  }

  void signInSubmit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().signIn(
        email: emailController.text,
        password: passwordController.text,
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
