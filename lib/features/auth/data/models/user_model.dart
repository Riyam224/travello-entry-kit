import 'package:firebase_auth/firebase_auth.dart';
import 'package:travello/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.name,
    required super.email,
    required super.password,
    required super.phoneNumber,
    required super.uId,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      password: '',
      phoneNumber: user.phoneNumber ?? '',
      uId: user.uid,
    );
  }
}
