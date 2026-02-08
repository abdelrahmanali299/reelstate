import 'package:flutter/material.dart';
import 'package:reelstate/features/auth/presentation/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backbutton
      appBar: AppBar(
        backgroundColor: Color(0xffF6F8F8),
        leading: IconButton(
          color: Color(0xff11D4C4),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Color(0xffF6F8F8),
      body: SafeArea(child: SignUpViewBody()),
    );
  }
}
