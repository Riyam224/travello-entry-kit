import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:travello/core/errors/exceptions.dart';
import 'package:travello/core/errors/failure.dart';
import 'package:travello/core/services/database_service.dart';
import 'package:travello/core/services/firebase_auth_service.dart';
import 'package:travello/core/utils/backend_endpoints..dart';

import 'package:travello/features/auth/data/models/user_model.dart';
import 'package:travello/features/auth/domain/entity/user_entity.dart';
import 'package:travello/features/auth/domain/rspos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImp({
    required this.databaseService,
    required this.firebaseAuthService,
  });

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
      final userModel = UserModel(
        name: name,
        email: email,
        password: password,
        phoneNumber: phone,
        uId: user.uid,
      );
      await addUserdData(user: userModel);
      return right(userModel);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('createUserWithEmailandPassword error: $e');
      return left(ServerFailure('Failed to create user.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthService.signInWithEmailandPassword(
        email: email,
        password: password,
      );
      final userEntity = await getUserData(uId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('signInWithEmailandPassword error: $e');
      return left(ServerFailure('Failed to sign in user.'));
    }
  }

  @override
  Future<void> addUserdData({required UserEntity user}) async {
    await databaseService.addData(
      path: 'users',
      documentId: user.uId,
      data: user.toMap(),
    );
  }

  @override
  Future<void> deleteUserData({required String uId}) async {
    await databaseService.deleteData(
      path: BackendEndpoints.addUserData,
      documentId: uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoints.addUserData,
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }
}
