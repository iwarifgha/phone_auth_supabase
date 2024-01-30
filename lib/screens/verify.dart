import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_phone_auth/bloc/auth_states.dart';

import '../bloc/auth_cubit.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    TextEditingController codeController = TextEditingController();

    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        state as AuthVerifyOtpState;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Verify OTP'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Your OTP input field
                TextField(
                  textAlign: TextAlign.center,
                  controller: codeController,
                  decoration: const InputDecoration(
                    label: Center(
                      child: Text('OTP'),
                    ),
                   ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Call the function to verify OTP
                    context.read<AuthCubit>().verifyOtp(codeController.text, state.phone);
                  },
                  child: const Text('Verify'),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
