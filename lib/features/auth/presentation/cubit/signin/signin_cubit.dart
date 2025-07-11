import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travello/features/auth/domain/rspos/auth_repo.dart';
import 'package:travello/features/auth/presentation/cubit/signin/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailandPassword(email, password);
    result.fold(
      (failure) => emit(SigninError(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }
}
