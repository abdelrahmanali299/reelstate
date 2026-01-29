import 'package:flutter/material.dart';

class CustomFavarateIcon extends StatelessWidget {
  const CustomFavarateIcon({super.key, required this.isFav});
  final bool isFav;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(
        Icons.favorite_border,
        color: isFav ? Colors.red : Colors.grey,
      ),
    );
  }
}
