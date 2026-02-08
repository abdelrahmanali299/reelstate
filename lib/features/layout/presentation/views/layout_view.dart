import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/services/get_it_service.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/get_realestates_cubit.dart/get_realestates_cubit.dart';
import 'package:reelstate/features/layout/presentation/manager/layout/layout_cubit.dart';
import 'package:reelstate/features/layout/presentation/views/widgets/bottom_nav.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
          create: (context) =>
              GetRealestatesCubit(GetItService.getIt<HomeRepo>()),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: BottomNav(),
        body: BlocBuilder<LayoutCubit, LayoutState>(
          builder: (context, state) {
            return context.read<LayoutCubit>().screens[context
                .read<LayoutCubit>()
                .currentIndex];
          },
        ),
      ),
    );
  }
}
