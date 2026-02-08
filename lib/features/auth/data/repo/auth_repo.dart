import 'package:dartz/dartz.dart';
import 'package:reelstate/features/auth/data/model/user_model.dart';

abstract class AuthRepo {
  Future<Either<String, UserModel>> signIn({
    required String email,
    required String password,
  });
  Future<Either<String, void>> signUp({required UserModel userModel});
  // forgot password
  Future<Either<String, void>> forgotPassword({required String email});
}
