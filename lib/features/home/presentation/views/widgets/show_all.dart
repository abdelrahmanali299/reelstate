import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/filter_realestates_cubit/filter_realestates_cubit.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/get_realestates_cubit.dart/get_realestates_cubit.dart';
import 'package:reelstate/features/home/presentation/views/show_all_realestates_view.dart';

class ShowAll extends StatelessWidget {
  const ShowAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('مرشحه لك', style: AppTextStyles.bold20),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (innerContext) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: context.read<GetRealestatesCubit>(),
                    ),
                    BlocProvider.value(
                      value: context.read<FilterRealestatesCubit>(),
                    ),
                  ],
                  child: ShowAllRealestatesView(),
                ),
              ),
            );

            context.read<FilterRealestatesCubit>().currentCategoryIndex =
                context.read<FilterRealestatesCubit>().currentSubCategoryIndex =
                    -1;
            context.read<GetRealestatesCubit>().getRealestates(type: null);
          },
          child: Text(
            'عرض المزيد',
            style: AppTextStyles.bold14.copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
