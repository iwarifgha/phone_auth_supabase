import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:supabase_phone_auth/bloc/auth_cubit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late String phoneNumber;

  String formatPhone(String countryCode, String number){
    final formattedNumber = number.replaceFirst(RegExp(r'^[0-9]'), '');
    return phoneNumber = countryCode + formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your phone number input field
            IntlPhoneField(
              decoration: const InputDecoration(
                  labelText: 'Phone Number'),
              initialCountryCode: 'NG', // You can set the initial country code if needed
              onChanged: (phone) {
                // Handle phone number changes
                formatPhone(phone.countryCode, phone.number);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the function to send OTP
                context.read<AuthCubit>().sendOTP(phoneNumber);
              },
              child: const Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

