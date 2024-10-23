import 'package:flutter/material.dart';

// Widget for displaying a card frame with balance details
class CardFrame extends StatelessWidget {
  final Color backgroundColor;
  final double rotationZ;
  final double width;
  final double height;

  const CardFrame({
    super.key,
    required this.backgroundColor,
    required this.rotationZ,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationZ * 3.14159 / 180, // Convert degrees to radians
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            // Total Balance text
            const Positioned(
              left: 22,
              top: 10,
              child: Text(
                'Total Balance',
                style: TextStyle(
                  color: Color(0xFF575757),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  height: 7.5,
                ),
              ),
            ),
            // Card number
            const Positioned(
              left: 22,
              top: 85,
              child: Text(
                '**** **** **** 1234',
                style: TextStyle(
                  color: Color(0xFF575757),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  height: 7.5,
                ),
              ),
            ),
            // Balance amount
            const Positioned(
              left: 22,
              top: 35,
              child: Text(
                '₹23,345.43',
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  height: 6.67,
                ),
              ),
            ),
            // Card logo (two overlapping circles)
            Positioned(
              right: 53,
              bottom: 17,
              child: SizedBox(
                width: 45,
                height: 30,
                child: Stack(
                  children: [
                    // Right circle
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF575757).withOpacity(0.44),
                        ),
                      ),
                    ),
                    // Left circle
                    Positioned(
                      left: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF323232),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for displaying a background frame for the card
class CardBackgroundFrame1 extends StatelessWidget {
  const CardBackgroundFrame1({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -7 * 3.14159 / 180, // Convert degrees to radians
      child: Container(
        width: 334,
        height: 175,
        decoration: BoxDecoration(
          color: const Color(0xFFAFADAD).withOpacity(0.74),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
