import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/get_dummy_realestates.dart';
import 'package:reelstate/core/utils/widgets/custom_error.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/get_realestates_cubit.dart/get_realestates_cubit.dart';
import 'package:reelstate/features/home/presentation/views/widgets/egar_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EgarView extends StatefulWidget {
  const EgarView({super.key});

  @override
  State<EgarView> createState() => _EgarViewState();
}

class _EgarViewState extends State<EgarView> {
  @override
  void initState() {
    super.initState();
    context.read<GetRealestatesCubit>().getEgarRealestates();
  }

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
                return EgarViewBody(realestates: state.realestates);
              }

              return Skeletonizer(
                child: EgarViewBody(realestates: getDummyRealestates()),
              );
            },
          ),
        ),
      ),
    );
  }
}
