import 'package:flutter/material.dart';

class CardFrame extends StatelessWidget {
  final Color backgroundColor;
  final double rotationZ;
  final double width;
  final double height;

  const CardFrame({
    Key? key,
    required this.backgroundColor,
    required this.rotationZ,
    required this.width,
    required this.height,
  }) : super(key: key);

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
            const Positioned(
              left: 22,
              top: 85,  // Adjust this value if needed
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
            const Positioned(
              left: 22,
              top: 35,
              child: Text(
                '\$23,345.43',
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  height: 6.67,
                ),
              ),
            ),
            Positioned(
              right: 53,
              bottom: 17,
              child: SizedBox(
                width: 45,
                height: 30,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF575757).withOpacity(0.44),
                        ),
                      ),
                    ),
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
