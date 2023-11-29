import 'package:flutter/material.dart';
import 'package:turf_ticker/Auth/login_screen.dart';
import 'package:turf_ticker/Auth/signup_screen.dart';
import 'package:turf_ticker/Home/home_screen.dart';

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
      theme: ThemeData(primarySwatch: Colors.grey),
      title: 'Flutter Demo',
      home: const ScreenHome(),
      routes: {
        '/login': (context) => const ScreenLogin(),
        '/signup-1': (context) => const ScreenSignup(),
      },
    );
  }
}
