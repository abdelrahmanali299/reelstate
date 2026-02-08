import 'package:flutter/material.dart';

class SuccessSign extends StatefulWidget {
  const SuccessSign({super.key});

  @override
  State<SuccessSign> createState() => _SuccessSignState();
}

class _SuccessSignState extends State<SuccessSign>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ScaleTransition(
          scale: animationController,
          child: CircleAvatar(radius: 80, backgroundColor: Colors.grey[200]),
        ),
        CircleAvatar(
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
        ),
      ],
    );
  }
}
