import 'package:flutter/material.dart';
import 'CardDetails.dart';
import 'expensedetails.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/menu_03.png',
                    width: 40,
                    height: 25,
                  ),
                ),
              ),
              const Text(
                "Home",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3F3F3F),
                  letterSpacing: 0.1,
                ),
              ),
              Container(), // Empty Box equivalent for alignment
            ],
          ),
          const SizedBox(height: 30), // Spacer equivalent
          const Stack(
            children: [
              Positioned(
                child: CardFrame(
                  backgroundColor: Color(0xBDAFADAD),
                  rotationZ: 7.0,
                  width: 334.0,
                  height: 175.0,
                ),
              ),
              Positioned(
                child: CardFrame(
                  backgroundColor:  Color(0xBDAFADAD),
                  rotationZ: -7.0,
                  width: 334.0,
                  height: 175.0,
                ),
              ),
              Positioned(
                child: CardFrame(
                  backgroundColor:  Color(0xFFF3F3F3),
                  rotationZ: 0.0,
                  width: 334.0,
                  height: 175.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30), // Spacer equivalent
          const Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Recent Activity",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3F3F3F),
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF575757),
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 0), // Spacer equivalent
                Expanded(
                  child: TransactionsListPreview(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
