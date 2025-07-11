import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travello/core/services/get_it_service.dart';
import 'package:travello/features/auth/domain/rspos/auth_repo.dart';
import 'package:travello/features/auth/presentation/cubit/signin/signin_cubit.dart';
import 'package:travello/features/auth/presentation/cubit/signin/signin_state.dart';
import 'package:travello/features/auth/presentation/widgets/signIn_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = 'sign-in';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return BlocConsumer<SigninCubit, SigninState>(
              listener: (context, state) {
                if (state is SigninError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
                if (state is SigninSuccess) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is SigninLoading ? true : false,
                  child: SignInViewBody(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
