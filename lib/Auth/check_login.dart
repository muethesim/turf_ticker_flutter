import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_ticker/Auth/login_screen.dart';
import 'package:turf_ticker/Home/home_screen.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({super.key});

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  List<String> latedata = ['', '', '', '', ''];

  _loadPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));
    if (prefs.getStringList('user') == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const ScreenLogin())));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const ScreenHome())));
    }
  }

  @override
  void initState() {
    _loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/grass.png",
              width: 200,
            ),
            const Text(
              "TURFTICKER",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
