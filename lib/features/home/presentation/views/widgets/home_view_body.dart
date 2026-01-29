import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/get_realestates_cubit.dart/get_realestates_cubit.dart';
import 'package:reelstate/features/home/presentation/views/show_all_realestates_view.dart';
import 'package:reelstate/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:reelstate/features/home/presentation/views/widgets/products_categories_grid.dart';
import 'package:reelstate/features/home/presentation/views/widgets/recommended_realestate_images.dart';
import 'package:reelstate/features/home/presentation/views/widgets/search_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              HomeAppBar(),
              SizedBox(height: 12),
              HomeSearchBar(),
              SizedBox(height: 16),
              ProductsCategoriesGrid(),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('مرشحه لك', style: AppTextStyles.bold20),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (innerContext) => BlocProvider.value(
                            value: context.read<GetRealestatesCubit>(),
                            child: ShowAllRealestatesView(),
                          ),
                        ),
                      );

                      context.read<GetRealestatesCubit>().getRealestates();
                    },
                    child: Text(
                      'عرض المزيد',
                      style: AppTextStyles.bold14.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: RecommendedRealestateImages(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
