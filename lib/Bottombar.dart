// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'chartscreen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity, // Set the width to fill the available space
      color: Colors.white,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom), // equivalent of navigationBarsPadding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomAppBarItem(
            imagePath: selectedItemIndex == 0
                ? 'assets/images/home_outlined.png' // Replace with your selected image
                : 'assets/images/home.png', // Replace with your unselected image
            label: "Home",
            isSelected: selectedItemIndex == 0,
            onClick: () {
              setState(() {
                selectedItemIndex = 0;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          BottomAppBarItem(
            imagePath: 'assets/images/add.png', // Replace with your add image
            label: "Add",
            isSelected: false, // No selection state for Add
            onClick: () {
              // Handle Add click
            },
          ),
          BottomAppBarItem(
            imagePath: selectedItemIndex == 2
                ? 'assets/images/chart_selected.png' // Replace with your selected image
                : 'assets/images/chart.png', // Replace with your unselected image
            label: "Chart",
            isSelected: selectedItemIndex == 2,
            onClick: () {
              setState(() {
                selectedItemIndex = 2;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChartScreen()),
              );
            },
          ),
          BottomAppBarItem(
            imagePath: 'assets/images/user.png', // Replace with your user image
            label: "User",
            isSelected: false, // No selection state for User
            onClick: () {
              // Handle User click
            },
          ),
        ],
      ),
    );
  }
}

class BottomAppBarItem extends StatelessWidget {
  final String imagePath; // Change to accept image path
  final String label;
  final bool isSelected;
  final VoidCallback onClick;

  const BottomAppBarItem({super.key, 
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected ? const Color(0xFF33907C) : Colors.grey;

    return GestureDetector(
      onTap: onClick,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 24.0, // Set the width of the image
            height: 24.0, // Set the height of the image
            color: isSelected ? iconColor : null, // Change color if needed
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              color: iconColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
