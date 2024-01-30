
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> signInUser(String phoneNumber) async {
  await Supabase.instance.client.auth.signInWithOtp(
    phone: phoneNumber,
    shouldCreateUser: true
  );
 }

Future<User?> verifyUser({
  required String otp,
  required String phone
}) async {
  try {
    final response = await Supabase.instance.client.auth.verifyOTP(
        token: otp,
        type: OtpType.sms,
      phone: phone
    );
     return response.user;
  } on Exception catch (e) {
    throw Exception(e.toString());
  }
}


Stream<AuthState> get currentState => Supabase.instance.client.auth.onAuthStateChange;

