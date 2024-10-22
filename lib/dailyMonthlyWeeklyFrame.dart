// ignore: file_names
import 'package:flutter/material.dart';

class DailyMonthlyWeeklyFrame extends StatefulWidget {
  const DailyMonthlyWeeklyFrame({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DailyMonthlyWeeklyFrameState createState() => _DailyMonthlyWeeklyFrameState();
}

class _DailyMonthlyWeeklyFrameState extends State<DailyMonthlyWeeklyFrame> {
  // State to track the selected option
  String selectedOption = 'Monthly';

  // Function to generate the Row for each option
  Widget buildOptionRow(String option) {
    bool isSelected = selectedOption == option;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xfff3f3f3) : const Color(0xff323232),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          option,
          style: TextStyle(
            color: isSelected ? const Color(0xff323232) : const Color(0xfff3f3f3),
            fontSize: 16,
            letterSpacing: 0.1,
            height: 1.5,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10), // Adjusted padding for better alignment
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff323232),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), // More consistent padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly distribute space
          children: [
            buildOptionRow('Daily'),
            buildOptionRow('Weekly'),
            buildOptionRow('Monthly'),
          ],
        ),
      ),
    );
  }
}
