import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.color,
    required this.titleColor,
    this.onTap,
    this.width = double.infinity,
    this.height = 50,
    this.borderColor = Colors.white,
  });

  final String title;
  final Color color;
  final Color borderColor;
  final Color titleColor;
  final VoidCallback? onTap;
  final double width;
  final double height;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(widget.width, widget.height),
        backgroundColor: widget.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: widget.borderColor, width: 2),
      ),
      onPressed: widget.onTap,
      child: Text(widget.title, style: TextStyle(color: widget.titleColor)),
    );
  }
}
