import 'package:flutter/material.dart';
import 'package:reelstate/features/auth/presentation/view/widgets/sign_up_text_fields_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: SingleChildScrollView(child: SignUpTextFieldsSection()),
    );
  }
}
