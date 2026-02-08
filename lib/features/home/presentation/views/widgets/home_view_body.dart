import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/services/get_it_service.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/filter_realestates_cubit/filter_realestates_cubit.dart';
import 'package:reelstate/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:reelstate/features/home/presentation/views/widgets/products_categories_grid.dart';
import 'package:reelstate/features/home/presentation/views/widgets/recommended_realestate_images.dart';
import 'package:reelstate/features/home/presentation/views/widgets/search_bar.dart';
import 'package:reelstate/features/home/presentation/views/widgets/show_all.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FilterRealestatesCubit(GetItService.getIt<HomeRepo>()),
      child: Builder(
        builder: (context) {
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
                    ShowAll(),
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
        },
      ),
    );
  }
}
