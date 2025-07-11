import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travello/core/services/get_it_service.dart';
import 'package:travello/features/auth/domain/rspos/auth_repo.dart';
import 'package:travello/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:travello/features/auth/presentation/cubit/signup/signup_state.dart';
import 'package:travello/features/auth/presentation/widgets/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'sign-up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is SignupLoading ? true : false,
                  child: SignupViewBody(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
