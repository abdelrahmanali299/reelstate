import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reelstate/features/auth/data/model/user_model.dart';
import 'package:reelstate/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    log(change.toString());
  }

  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  Future<void> signUp({required UserModel userModel}) async {
    emit(SignUpLoading());
    final result = await authRepo.signUp(userModel: userModel);
    result.fold((failure) => emit(SignUpFailure(message: failure)), (signup) {
      emit(SignUpSuccess());
    });
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    final result = await authRepo.signIn(email: email, password: password);
    return result.fold(
      (failure) {
        emit(SignInFailure(message: failure));
      },
      (signin) {
        emit(SignInSuccess(userModel: signin));
      },
    );
  }

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordloading());
    final result = await authRepo.forgotPassword(email: email);
    result.fold((failure) => emit(ForgotPasswordFailure(message: failure)), (
      forgotPassword,
    ) {
      emit(ForgotPasswordSuccess());
    });
  }
}
