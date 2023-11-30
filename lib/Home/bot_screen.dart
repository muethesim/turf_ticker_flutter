import 'package:flutter/material.dart';

class BodyBot extends StatelessWidget {
  const BodyBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.asset(
                "assets/img/botonwork.jpg",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "WILL BE OUT SOON...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
