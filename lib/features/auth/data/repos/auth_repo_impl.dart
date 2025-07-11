import 'package:dartz/dartz.dart';
import 'package:travello/core/errors/exceptions.dart';
import 'package:travello/core/errors/failure.dart';
import 'package:travello/core/services/firebase_auth_service.dart';
import 'package:travello/features/auth/data/models/user_model.dart';
import 'package:travello/features/auth/domain/entity/user_entity.dart';
import 'package:travello/features/auth/domain/rspos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImp({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailandPassword(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailandPasswprd(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
