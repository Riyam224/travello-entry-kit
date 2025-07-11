import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:travello/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailandPasswprd({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'No internet connection.');
      }
    } catch (e) {
      throw CustomException(message: e.toString());
    }

    throw CustomException(message: 'Failed to create user.');
  }

  // todo
  Future<User> signInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      // log('Exception in firebase auth service: $e'); // ✅ Logs the error
      debugPrint('Exception in firebase auth service: $e');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'Wrong password provided for that user.',
        );
      } else if (e.code == 'network request timeout') {
        {
          throw CustomException(
            message: 'Network request timeout check the internet',
          );
        }
      } else {
        throw CustomException(message: e.toString());
      }
    }
  }
}
