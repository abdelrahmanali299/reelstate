import 'package:flutter/material.dart';

class RequestRealestateIndecator extends StatelessWidget {
  const RequestRealestateIndecator({super.key, required this.currentindex});

  final int currentindex;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: List.generate(
        3,
        (index) => Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: index <= currentindex ? Colors.blue : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
