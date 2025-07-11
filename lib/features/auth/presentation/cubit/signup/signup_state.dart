import 'package:equatable/equatable.dart';
import 'package:travello/features/auth/domain/entity/user_entity.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity userEntity;
  const SignupSuccess(this.userEntity);
}

final class SignupError extends SignupState {
  final String message;
  const SignupError(this.message);
}
