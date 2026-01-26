import 'package:flutter/material.dart';
import 'package:reelstate/features/home/presentation/views/widgets/tamleek_view_body.dart';

class TamleekView extends StatelessWidget {
  const TamleekView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TamleekViewBody(),
        ),
      ),
    );
  }
}
