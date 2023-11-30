import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_ticker/Auth/login_screen.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({super.key});

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  List<String> latedata = ['', '', '', '', ''];

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      latedata = (prefs.getStringList('user') ?? ['', '', '', '', '']);
    });
    print(latedata);
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(400),
          child: Image.asset(
            "assets/img/avatar.png",
            width: 200,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          latedata[2],
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        Text(
          "@${latedata[1]}",
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          'Mail : ${latedata[0]}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Phone : ${latedata[3]}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () async {
            final preferences = await SharedPreferences.getInstance();
            if (preferences.getStringList('user') != null) {
              preferences.remove('user');
            }
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ScreenLogin()));
            print("HERE");
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                color: Colors.white,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
