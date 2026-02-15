import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/services/function/custom_snack_bar.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custem_text_field.dart';
import 'package:reelstate/core/utils/widgets/custom_button.dart';
import 'package:reelstate/core/utils/widgets/custom_text_button.dart';
import 'package:reelstate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:reelstate/features/auth/presentation/view/widgets/forgot_password_section.dart';
import 'package:reelstate/features/layout/presentation/views/layout_view.dart';

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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          customSnackBar(context, state.message, Colors.red);
        }
        if (state is SignInSuccess) {
          final messenger = ScaffoldMessenger.of(context);

          messenger
              .showSnackBar(
                const SnackBar(
                  content: Text('تم تسجيل الدخول بنجاح'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              )
              .closed
              .then((_) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LayoutView()),
                  (route) => false,
                );
              });
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        value: signinContext.read<AuthCubit>(),
                        child: ForgotPasswordSection(),
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
