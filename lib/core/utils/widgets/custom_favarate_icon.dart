import 'package:flutter/material.dart';

class CustomFavarateIcon extends StatelessWidget {
  const CustomFavarateIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(Icons.favorite_border, color: Colors.grey),
    );
  }
}
