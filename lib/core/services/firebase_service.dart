import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reelstate/features/auth/data/model/user_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signUp({
    required UserModel userModel,
    required String mainPath,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: userModel.email ?? '',
      password: userModel.password ?? '',
    );
    final uid = userCredential.user!.uid;

    await _firestore.collection(mainPath).doc(uid).set({
      'id': uid,
      'email': userModel.email,
      'name': userModel.name,
      'phone': userModel.phone,
      'addressModel': userModel.addressModel.toJson(),
    });
    return userCredential;
  }
}
