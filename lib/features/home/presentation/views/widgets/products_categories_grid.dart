import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/features/home/data/models/categories_model.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/get_realestates_cubit.dart/get_realestates_cubit.dart';
import 'package:reelstate/features/home/presentation/views/egar_view.dart';
import 'package:reelstate/features/home/presentation/views/tamleek_view.dart';
import 'package:reelstate/features/home/presentation/views/widgets/products_cat_grid_body.dart';

class ProductsCategoriesGrid extends StatelessWidget {
  const ProductsCategoriesGrid({super.key});
  final List<CategoriesModel> categories = const [
    CategoriesModel(title: 'شقق تمليك', img: 'assets/images/tamleek.png'),
    CategoriesModel(title: 'شقق ايجار', img: 'assets/images/egar.jpg'),
    CategoriesModel(
      title: 'صمم شقتك على مزاجك',
      img: 'assets/images/design_your_reelstate.png',
    ),
    CategoriesModel(title: 'تشطيبات', img: 'assets/images/tashteep.png'),
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
      itemBuilder: (outerContext, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              outerContext,
              MaterialPageRoute(
                builder: (context) {
                  switch (index) {
                    case 0:
                      return BlocProvider.value(
                        value: outerContext.read<GetRealestatesCubit>(),
                        child: TamleekView(),
                      );

                    case 1:
                      return BlocProvider.value(
                        value: outerContext.read<GetRealestatesCubit>(),
                        child: EgarView(),
                      );

                    case 2:
                      return Scaffold();

                    case 3:
                      return Scaffold();

                    default:
                      return Scaffold();
                  }
                },
              ),
            );
          },
          child: ProductsCatGridBody(
            title: categories[index].title,
            img: (categories[index].img),
          ),
        );
      },
      itemCount: 4,
    );
  }
}
