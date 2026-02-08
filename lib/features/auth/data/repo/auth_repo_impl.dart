import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reelstate/core/services/failure.dart';
import 'package:reelstate/core/services/firebase_service.dart';
import 'package:reelstate/core/services/firestore_services.dart';
import 'package:reelstate/features/auth/data/model/user_model.dart';
import 'package:reelstate/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final snapshot = await FirestoreService().getData(
        '',
        'users',
        query: {'where': email},
      );
      // if (snapshot == null) {
      //   return left(Failure(message: 'No user found'));
      // }
      await FirebaseService().signIn(email: email, password: password);
      return right(UserModel.fromJson(snapshot!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(Failure(message: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return left(Failure(message: 'Wrong password provided for that user.'));
      } else {
        return left(Failure(message: 'user error'));
      }
    }
  }

  @override
  Future<Either<Failure, void>> signUp({required UserModel userModel}) async {
    try {
      bool isUSerExist = await FirestoreService().isUserExist(
        userModel.name!,
        'users',
      );
      if (isUSerExist) {
        return left(Failure(message: 'User already exist'));
      }
      await FirebaseService().signUp(userModel: userModel, mainPath: 'users');
      // await FirestoreService().addData(
      //   userModel.id!,
      //   'users',
      //   userModel.toJson(),
      // );
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(Failure(message: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return left(
          Failure(message: 'The account already exists for that email.'),
        );
      } else if (e.code == 'invalid-email') {
        return left(Failure(message: 'The email address is not valid.'));
      } else {
        return left(
          Failure(
            message: 'FirebaseAuth error: ${e.message ?? 'Unknown error'}',
          ),
        );
      }
    } catch (e) {
      if (FirebaseAuth.instance.currentUser != null) {
        await FirebaseAuth.instance.currentUser!.delete();
      }
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(Failure(message: 'لا يوجد حساب بهذا البريد'));
      } else if (e.code == 'invalid-email') {
        return left(Failure(message: 'البريد الإلكتروني غير صالح'));
      } else {
        return left(Failure(message: e.message ?? 'خطأ غير معروف'));
      }
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
