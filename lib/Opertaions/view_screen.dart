import 'package:flutter/material.dart';

class ScreenViewBooking extends StatefulWidget {
  const ScreenViewBooking({super.key});

  @override
  State<ScreenViewBooking> createState() => _ScreenViewBookingState();
}

class _ScreenViewBookingState extends State<ScreenViewBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Icon(Icons.arrow_back_ios_new),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
