// In SignInScreen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_phone_auth/bloc/auth_cubit.dart';
import 'package:supabase_phone_auth/screens/home.dart';
import 'package:supabase_phone_auth/screens/verify.dart';

import '../screens/sign_in.dart';
import 'auth_cubit_states.dart';

class AuthStateLogic extends StatelessWidget {
  const AuthStateLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthCubitState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
                child: CircularProgressIndicator());
          } else if (state is AuthSuccessState) {
            return const HomeScreen();
          }  else if (state is AuthSignInState) {
            return const SignInScreen();
          } else if (state is AuthVerifyOtpState) {
            return const VerifyOTPScreen();
          } else {
            //The only logical remaining state is the error state. So we cast the current state to AuthErrorState.
            state as AuthErrorState;
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
        },
      ),
    );
  }
}
