import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:turf_ticker/Opertaions/finished_screen.dart';
import 'package:turf_ticker/Opertaions/upcoming_screen.dart';

class ScreenViewBooking extends StatefulWidget {
  final List finishedData;
  final List upcomingData;

  const ScreenViewBooking(
      {super.key, required this.finishedData, required this.upcomingData});

  @override
  State<ScreenViewBooking> createState() => _ScreenViewBookingState();
}

class _ScreenViewBookingState extends State<ScreenViewBooking> {
  int pageNow = 0;

  var screens = [
    const BodyUpcoming(
      data: [],
    ),
    const BodyFinished(
      data: [],
    ),
  ];

  @override
  void initState() {
    print("Finished : ${widget.finishedData}");
    setState(() {
      screens = [
        BodyUpcoming(
          data: widget.upcomingData,
        ),
        BodyFinished(
          data: widget.finishedData,
        ),
      ];
    });
    print(widget.upcomingData);
    super.initState();
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
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.grey.shade800,
          child: screens[pageNow]),
    );
  }
}
