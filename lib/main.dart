import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'bloc/auth_cubit.dart';
import 'bloc/auth_state_logic.dart';

void main() {
  Supabase.initialize(
      url: 'https://jhhvclfbhvccvxllheqf.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
          'eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpoaHZjbGZiaHZjY3Z4bGxoZXFm'
          'Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODgwMTg1NzMsImV4cCI6MjAwMzU5NDU3M30.'
          'v5OPEJeEdKBKh6el_y4yZ8CEaRjMt5j-IvuWNyweiNM'
  );
  runApp(const MyPhoneAuthApp());
}

class MyPhoneAuthApp extends StatelessWidget {
  const MyPhoneAuthApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AuthCubit(),
        child: const AuthStateLogic(),
      ),
    );
  }
}



