import 'package:bloc/bloc.dart';

import '../repository/auth_repository.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthSignInState());



  Future<void> sendOTP(String phoneNumber) async {
    emit(AuthLoadingState());

    try {
      // Call the signInUser function
      await signInUser(phoneNumber);
      emit(AuthVerifyOtpState(phoneNumber));
    } catch (error) {
      emit(AuthErrorState(error.toString()));
    }
  }

  Future<void> verifyOtp(String otp, String phone) async {
    emit(AuthLoadingState());

    try {
      // Call the verifyOTP function
      final user = await verifyUser(phone: phone, otp: otp);
      if(user == null) throw Exception('no user found');
      emit(AuthSuccessState(user));
    } on Exception catch (error) {
      emit(AuthErrorState(error.toString()));
    }
  }

}

//create a supabase project
//create flutter project
//write your screens
//write your repository
//write your bloc
//test the code
//set up phone auth in supabase
//set up Vonage
//test the code again.


