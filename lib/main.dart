import 'package:flutter/material.dart';
import 'package:turf_ticker/Home/login_screen.dart';
import 'package:turf_ticker/Home/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const ScreenLogin(),
      routes: {
        '/login': (context) => const ScreenLogin(),
        '/signup-1': (context) => const ScreenSignup(),
      },
    );
  }
}
