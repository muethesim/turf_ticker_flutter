import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:turf_ticker/Home/profile_screen.dart';
import 'package:turf_ticker/Home/turf_screen.dart';

class ScreenViewBooking extends StatefulWidget {
  const ScreenViewBooking({super.key});

  @override
  State<ScreenViewBooking> createState() => _ScreenViewBookingState();
}

class _ScreenViewBookingState extends State<ScreenViewBooking> {
  int pageNow = 0;
  final _messageController = TextEditingController();
  final screens = [
    const BodyTurf(),
    const BodyProfile(),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
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
          Icon(Icons.date_range_outlined),
          Icon(Icons.check),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
