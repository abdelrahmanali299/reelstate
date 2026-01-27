import 'package:flutter/material.dart';
import 'package:reelstate/features/home/presentation/views/product_details_view.dart';
import 'package:reelstate/features/home/presentation/views/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .8,
        crossAxisSpacing: 10,
        mainAxisExtent: MediaQuery.sizeOf(context).height * .4,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsView(productIndex: index),
          ),
        ),
        child: ProductItem(productIndex: index),
      ),
      itemCount: 10,
    );
  }
}
