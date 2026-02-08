import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/features/auth/data/repo/auth_repo_impl.dart';
import 'package:reelstate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:reelstate/features/auth/presentation/view/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F8F8),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthCubit(AuthRepoImpl()),
          child: SignInViewBody(),
        ),
      ),
    );
  }
}
