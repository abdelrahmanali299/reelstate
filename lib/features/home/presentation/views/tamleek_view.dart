import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/get_dummy_realestates.dart';
import 'package:reelstate/core/utils/widgets/custom_error.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/get_realestates_cubit.dart/get_realestates_cubit.dart';
import 'package:reelstate/features/home/presentation/views/widgets/tamleek_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TamleekView extends StatefulWidget {
  const TamleekView({super.key});

  @override
  State<TamleekView> createState() => _TamleekViewState();
}

class _TamleekViewState extends State<TamleekView> {
  @override
  void initState() {
    super.initState();
    context.read<GetRealestatesCubit>().getTamleekRealestates();
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
                return TamleekViewBody(realestates: state.realestates);
              }

              return Skeletonizer(
                child: TamleekViewBody(realestates: getDummyRealestates()),
              );
            },
          ),
        ),
      ),
    );
  }
}
