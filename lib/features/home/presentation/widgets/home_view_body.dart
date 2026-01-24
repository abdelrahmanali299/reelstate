import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/presentation/widgets/home_app_bar.dart';
import 'package:reelstate/features/home/presentation/widgets/products_categories_grid.dart';
import 'package:reelstate/features/home/presentation/widgets/search_bar.dart';

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
                  Text('Recommended for you', style: AppTextStyles.bold20),
                  Spacer(),
                  Text(
                    'See All',
                    style: AppTextStyles.bold14.copyWith(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 25),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset('assets/images/reelstate_img.png'),
                      ),
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
