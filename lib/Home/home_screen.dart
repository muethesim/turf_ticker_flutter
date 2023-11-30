import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:turf_ticker/Home/bot_screen.dart';
import 'package:turf_ticker/Home/message_screen.dart';
import 'package:turf_ticker/Home/profile_screen.dart';
import 'package:turf_ticker/Home/turf_screen.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int pageNow = 0;
  final _messageController = TextEditingController();
  final screens = [
    const BodyTurf(),
    const BodyProfile(),
    const BodyMessage(),
    const BodyBot(),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade800,
        animationDuration: const Duration(milliseconds: 300),
        color: Colors.grey.shade400,
        onTap: (index) {
          setState(() {
            pageNow = index;
          });
        },
        items: const [
          Icon(Icons.sports_soccer),
          Icon(Icons.person),
          Icon(Icons.mail),
          Icon(Icons.message),
        ],
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.grey.shade800,
            child: screens[pageNow]),
      ),
    );
  }
}
