import 'package:flutter/material.dart';
import 'package:reelstate/features/home/presentation/views/widgets/product_details_contact_info.dart';
import 'package:reelstate/features/home/presentation/views/widgets/product_details_images.dart';
import 'package:reelstate/features/home/presentation/views/widgets/product_details_info.dart';

class ProducDetailsBody extends StatelessWidget {
  const ProducDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductDetailsImages(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ProductDetailsInfo(),
          ),
          ProductDetailsContactInfo(),
        ],
      ),
    );
  }
}
