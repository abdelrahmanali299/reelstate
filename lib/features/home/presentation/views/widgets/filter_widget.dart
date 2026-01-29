import 'package:flutter/material.dart';
import 'package:reelstate/features/home/presentation/views/widgets/filter_item.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 12,
        children: [
          FilterItem(title: 'السعر', isActive: true),
          FilterItem(title: 'المساحة'),
          FilterItem(title: 'المكان'),
        ],
      ),
    );
  }
}
