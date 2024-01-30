import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_phone_auth/bloc/auth_cubit_states.dart';

import '../bloc/auth_cubit.dart';

class VerifyOTPScreen extends StatefulWidget {
    const VerifyOTPScreen({super.key,});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  TextEditingController codeController = TextEditingController();


  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

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
