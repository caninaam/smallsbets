import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smallsbets/FirebaseAuthService.dart';

class AuthScreen extends StatelessWidget {
  final FirebaseAuthService authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Google Sign-In')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            User? user = await authService.signInWithGoogle();
            if (user != null) {
              print('Signed in as: ${user.displayName}');
            } else {
              print('Sign in failed');
            }
          },
          child: Text('Sign in with Google test'),
        ),
      ),
    );
  }
}
