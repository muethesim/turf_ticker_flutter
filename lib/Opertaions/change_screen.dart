import 'package:flutter/material.dart';

class ScreenChange extends StatefulWidget {
  const ScreenChange({super.key});

  @override
  State<ScreenChange> createState() => _ScreenChangeState();
}

class _ScreenChangeState extends State<ScreenChange> {
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
              Column(
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
