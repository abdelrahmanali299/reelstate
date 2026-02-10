import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reelstate/core/services/firebase_service.dart';
import 'package:reelstate/core/services/firestore_services.dart';
import 'package:reelstate/features/auth/data/model/user_model.dart';
import 'package:reelstate/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<String, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await FirebaseService().signIn(
        email: email,
        password: password,
      );
      var snapshot = await FirestoreService().getData(
        userCredential.user!.uid,
        'users',
      );
      return right(UserModel.fromJson(snapshot!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('لا يوجد حساب بهذا البريد');
      } else if (e.code == 'wrong-password') {
        return left('كلمة المرور غير صحيحة');
      } else {
        log('FirebaseAuth error: ${e.message ?? 'Unknown error'}');
        return left('خطاء في تسجيل الدخول: ${e.message ?? 'Unknown error'}');
      }
    }
  }

  @override
  Future<Either<String, void>> signUp({required UserModel userModel}) async {
    try {
      bool isUSerExist = await FirestoreService().isUserExist(
        userModel.name!,
        'users',
      );
      if (isUSerExist) {
        return left('User already exist');
      }
      await FirebaseService().signUp(userModel: userModel, mainPath: 'users');

      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        return left('هذا البريد مستخدم بالفعل');
      } else if (e.code == 'invalid-email') {
        return left('البريد الإلكتروني غير صالح');
      } else {
        return left('FirebaseAuth error: ${e.message ?? 'Unknown error'}');
      }
    }
  }

  @override
  Future<Either<String, void>> forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('لا يوجد حساب بهذا البريد');
      } else if (e.code == 'invalid-email') {
        return left('البريد الإلكتروني غير صالح');
      } else {
        return left(e.message ?? 'خطأ غير معروف');
      }
    } catch (e) {
      return left('خطأ في استعادة كلمة المرور');
    }
  }
}
