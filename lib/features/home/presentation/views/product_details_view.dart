import 'package:flutter/material.dart';
import 'package:reelstate/features/home/presentation/views/widgets/produc_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ProducDetailsBody()));
  }
}
