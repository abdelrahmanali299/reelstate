import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/services/get_it_service.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/request_realestate_cubit/request_realestate_cubit.dart';
import 'package:reelstate/features/home/presentation/views/widgets/request_your_realestate_body.dart';

class RequestYourRealestateView extends StatelessWidget {
  const RequestYourRealestateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RequestRealestateCubit(GetItService.getIt<HomeRepo>()),
      child: Scaffold(body: SafeArea(child: RequestYourRealestateBody())),
    );
  }
}
