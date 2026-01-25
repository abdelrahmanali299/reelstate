import 'package:flutter/material.dart';
import 'package:reelstate/features/auth/signin/view/sign_in_view.dart';

void main() {
  runApp(const RealState());
}
class RealState extends StatelessWidget {
  const RealState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignInView(),
      ),
    );
  }
}