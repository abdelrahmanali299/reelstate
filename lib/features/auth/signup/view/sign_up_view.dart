import 'package:flutter/material.dart';
import 'package:reelstate/features/auth/signup/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SignUpViewBody(),);
  }
}