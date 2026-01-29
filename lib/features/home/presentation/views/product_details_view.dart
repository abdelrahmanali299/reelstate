import 'package:flutter/material.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/presentation/views/widgets/produc_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  final int productIndex;
  final RealestateModel realestateModel;
  const ProductDetailsView({
    super.key,
    this.productIndex = 0,
    required this.realestateModel,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProducDetailsBody(
          productIndex: productIndex,
          realestateModel: realestateModel,
        ),
      ),
    );
  }
}
