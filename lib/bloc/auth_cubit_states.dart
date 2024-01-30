
// States
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthCubitState {}

class AuthLoadingState extends AuthCubitState {}

class AuthSignInState extends AuthCubitState {}

class AuthSuccessState extends AuthCubitState {
  final User user;
  AuthSuccessState(this.user);
}

class AuthVerifyOtpState extends AuthCubitState {
  final String phone;
  AuthVerifyOtpState(this.phone);
}

class AuthErrorState extends AuthCubitState {
  final String errorMessage;
  AuthErrorState(this.errorMessage);
}
