import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travello/features/auth/domain/rspos/auth_repo.dart';
import 'package:travello/features/auth/presentation/cubit/signup/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailandPassword({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailandPassword(
      name,
      email,
      phone,
      password,
    );
    result.fold(
      (failure) => emit(SignupError(failure.message)),
      (user) => emit(SignupSuccess(user)),
    );
  }
}
