import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/data/models/categories_model.dart';
import 'package:reelstate/features/home/presentation/widgets/products_cat_grid_body.dart';

class ProductsCategoriesGrid extends StatelessWidget {
  const ProductsCategoriesGrid({super.key});
  final List<CategoriesModel> categories = const [
    CategoriesModel(title: 'Ownership Apartments', iconData: Icons.key),
    CategoriesModel(title: 'Rental Apartments', iconData: Icons.apartment),
    CategoriesModel(title: 'Custom Listings', iconData: Icons.list),
    CategoriesModel(title: 'Retail Spaces', iconData: Icons.store),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return ProductsCatGridBody(
          title: categories[index].title,
          iconData: categories[index].iconData,
        );
      },
      itemCount: 4,
    );
  }
}
