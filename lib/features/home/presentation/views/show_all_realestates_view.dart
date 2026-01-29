import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/get_dummy_realestates.dart';
import 'package:reelstate/core/utils/widgets/custom_error.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/get_realestates_cubit.dart/get_realestates_cubit.dart';
import 'package:reelstate/features/home/presentation/views/widgets/show_all_realestates_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowAllRealestatesView extends StatelessWidget {
  const ShowAllRealestatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<GetRealestatesCubit, GetRealestatesStates>(
            builder: (context, state) {
              if (state is GetRealestatesFailure) {
                return CustomError(message: state.error);
              }
              if (state is GetRealestatesSuccess) {
                return ShowAllRealestatesBody(realestates: state.realestates);
              }

              return Skeletonizer(
                child: ShowAllRealestatesBody(
                  realestates: getDummyRealestates(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
