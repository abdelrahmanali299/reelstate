import 'package:dartz/dartz.dart';
import 'package:reelstate/core/services/failure.dart';
import 'package:reelstate/features/auth/data/model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signUp({required UserModel userModel});
  // forgot password
  Future<Either<Failure, void >> forgotPassword({required String email});
}
