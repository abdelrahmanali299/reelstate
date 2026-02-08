import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/widgets/custem_text_field.dart';
import 'package:reelstate/core/utils/widgets/custom_button.dart';
import 'package:reelstate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class ForgotPasswordSection extends StatefulWidget {
  const ForgotPasswordSection({super.key});
  @override
  State<ForgotPasswordSection> createState() => _ForgotPasswordSectionState();
}

class _ForgotPasswordSectionState extends State<ForgotPasswordSection> {
  final emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(height: 100),
            CustomTextField(
              fillColor: Colors.white,
              hint: 'البريد الالكتروني',
              controller: emailController,
            ),
            Spacer(),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is ForgotPasswordSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                        bottom:
                            MediaQuery.of(context).size.height -
                            100, // يرفعه للأعلى
                        right: 20,
                        left: 20,
                      ),
                      backgroundColor: Colors.green,
                      content: Text('تم إرسال رابط إعادة تعيين كلمة المرور'),
                    ),
                  );
                } else if (state is ForgotPasswordFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                        bottom:
                            MediaQuery.of(context).size.height -
                            100, // يرفعه للأعلى
                        right: 20,
                        left: 20,
                      ),
                      backgroundColor: Colors.red,
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is ForgotPasswordloading,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().forgotPassword(
                        email: emailController.text,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  title: 'ُenter',
                  color: Color(0xff11D4C4),
                  titleColor: Colors.white,
                );
              },
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
