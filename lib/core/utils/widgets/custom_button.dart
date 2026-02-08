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
    this.isLoading = false,
  });

  final String title;
  final Color color;
  final Color borderColor;
  final Color titleColor;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final bool isLoading;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(widget.width, widget.height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: widget.borderColor),
        ),
        backgroundColor: Colors.blue,
      ),
      onPressed: widget.onTap,
      child: Text(widget.title, style: TextStyle(color: widget.titleColor)),
    );
  }
}
