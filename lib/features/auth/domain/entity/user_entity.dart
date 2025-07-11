import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String uId;

  const UserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.uId,
  });
  // todo
  toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'uId': uId,
    };
  }

  @override
  List<Object?> get props => [name, email, password, phoneNumber, uId];
}
