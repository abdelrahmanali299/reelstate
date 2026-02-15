import 'package:flutter/material.dart';

class SuccessSign extends StatelessWidget {
  const SuccessSign({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.green,

      child: CircleAvatar(
        radius: 38,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.green,
          child: Icon(Icons.check, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
