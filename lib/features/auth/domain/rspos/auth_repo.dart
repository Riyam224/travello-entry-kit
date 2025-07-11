import 'package:dartz/dartz.dart';
import 'package:travello/core/errors/failure.dart';
import 'package:travello/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailandPassword(
    String name,
    String email,
    String phone,
    String password,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailandPassword(
    String email,
    String password,
  );
  // todo firestore

  Future<void> addUserdData({required UserEntity user});
  Future<void> deleteUserData({required String uId});
  Future<UserEntity> getUserData({required String uId});
}
