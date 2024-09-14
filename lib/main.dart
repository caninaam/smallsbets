import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'AuthScreen.dart'; // Import the AuthScreen widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase before the app runs
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(), // Set AuthScreen as the home widget
    );
  }
}
