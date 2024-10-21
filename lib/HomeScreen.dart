import 'package:flutter/material.dart';
import 'CardDetails.dart';

class HomeScreen extends StatelessWidget {
  final Function(NavigatorState)? navController;

  const HomeScreen({super.key, this.navController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80), // Spacer equivalent
          Row(
            children: [
              Container(), // Empty Box equivalent
            ],
          ),
          const Stack(
            children: [
              Positioned(
                child: CardFrame(
                  backgroundColor: const Color(0xBDAFADAD),
                  rotationZ: 7.0,
                  width: 334.0,
                  height: 175.0,
                ),
              ),
              Positioned(
                child: CardFrame(
                  backgroundColor: const Color(0xBDAFADAD),
                  rotationZ: -7.0,
                  width: 334.0,
                  height: 175.0,
                ),
              ),
              Positioned(
                child: CardFrame(
                  backgroundColor: const Color(0xFFF3F3F3),
                  rotationZ: 0.0,
                  width: 334.0,
                  height: 175.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
