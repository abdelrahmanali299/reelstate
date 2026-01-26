import 'package:flutter/material.dart';

class UserImg extends StatelessWidget {
  const UserImg({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundImage: AssetImage('assets/images/user_img.png'),
    );
  }
}
