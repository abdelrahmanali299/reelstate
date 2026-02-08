import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/filter_realestates_cubit/filter_realestates_cubit.dart';
import 'package:reelstate/features/home/presentation/views/widgets/filter_item.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.type});
  final RealestateType? type;
  final List<String> titles = const ['السعر', 'المساحة', 'المكان'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 12,
        children: List.generate(
          titles.length,
          (index) => FilterItem(
            title: titles[index],
            type: type,
            isActive:
                index ==
                context.read<FilterRealestatesCubit>().currentCategoryIndex,
          ),
        ),
      ),
    );
  }
}
