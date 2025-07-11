import 'package:equatable/equatable.dart';
import 'package:travello/features/auth/domain/entity/user_entity.dart';

sealed class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity userEntity;
  const SigninSuccess(this.userEntity);
}

final class SigninError extends SigninState {
  final String message;
  const SigninError(this.message);
}
