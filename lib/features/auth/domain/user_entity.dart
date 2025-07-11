import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String password;
  final String uId;

  const UserEntity({
    required this.email,
    required this.password,
    required this.uId,
  });

  @override
  List<Object?> get props => [email, password, uId];
}
