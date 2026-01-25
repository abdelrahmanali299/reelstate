import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/features/layout/presentation/manager/layout/layout_cubit.dart';
import 'package:reelstate/features/layout/presentation/views/widgets/bottom_nav.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
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
