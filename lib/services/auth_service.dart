// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

// class AuthService {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   User? get currentUser => firebaseAuth.currentUser;

//   Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

//   Future<UserCredential> signIn({
//     required String email,
//     required String password,
//   }) async {
//     return await firebaseAuth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   Future<UserCredential> createAccount({
//     required String email,
//     required String password,
//   }) async {
//     return await firebaseAuth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   Future<void> signOut() async {
//     await firebaseAuth.signOut();
//   }

//   Future<void> resetPassword({required String email}) async {
//     await firebaseAuth.sendPasswordResetEmail(email: email);
//   }

//   Future<void> updateUsername({required String username}) async {
//     await currentUser!.updateDisplayName(username);
//   }

//   Future<void> deleteAccount({
//     required String email,
//     required String password,
//   }) async {
//     AuthCredential credential = EmailAuthProvider.credential(
//       email: email,
//       password: password,
//     );
//     await currentUser!.reauthenticateWithCredential(credential);
//     await currentUser!.delete();
//     await FirebaseAuth.instance.signOut();
//   }

//   Future<void> resetPasswordFromCurrentPassword({
//     required String currentPassword,
//     required String newPassword,
//     required String email,
//   }) async {
//     AuthCredential credential = EmailAuthProvider.credential(
//       email: email!,
//       password: currentPassword,
//     );
//     await currentUser!.reauthenticateWithCredential(credential);
//     await currentUser!.updatePassword(newPassword);
//   }
// }

// todo

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Current user
  User? get currentUser => _firebaseAuth.currentUser;

  // Stream of auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Sign In Method
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw FirebaseAuthException(
        code: 'sign-in-error',
        message: 'Sign-in failed: ${e.toString()}',
      );
    }
  }

  // Sign Up Method
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw FirebaseAuthException(
        code: 'sign-up-error',
        message: 'Sign-up failed: ${e.toString()}',
      );
    }
  }

  // Sign Out Method
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Reset Password Method
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
