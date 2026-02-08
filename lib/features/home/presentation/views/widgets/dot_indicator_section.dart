import 'package:flutter/material.dart';
import 'package:reelstate/features/home/presentation/views/widgets/dot_indictor.dart';

class DotIndicatorSection extends StatelessWidget {
  const DotIndicatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => DotIndictor(isActive: index == 0)),
    );
  }
}
