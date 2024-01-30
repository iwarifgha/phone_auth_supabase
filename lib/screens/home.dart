import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_phone_auth/bloc/auth_cubit.dart';
import 'package:supabase_phone_auth/bloc/auth_cubit_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,});

   @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        state as AuthSuccessState;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Center(
            child: Text('Welcome to the Home Screen! \n'
                'Your phone: ${state.user.phone}'
            ),
          ),
        );
      }
    );
  }
}
