import 'package:firebase_auth/firebase_auth.dart';
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
}
