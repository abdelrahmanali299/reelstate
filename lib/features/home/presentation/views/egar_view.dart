import 'package:flutter/material.dart';
import 'package:reelstate/features/home/presentation/views/widgets/egar_view_body.dart';

class EgarView extends StatelessWidget {
  const EgarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: EgarViewBody(),
        ),
      ),
    );
  }
}
