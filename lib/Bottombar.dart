// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'new_expense.dart';
import 'models/expenses.dart';
import 'HomeScreen.dart';
import 'chartscreen.dart';


class BottomBar extends StatefulWidget {
  final int selectedItemIndex; // Add this line

  const BottomBar({super.key, required this.selectedItemIndex}); // Update constructor

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _addNewExpense(BuildContext context, Expense newExpense) {
    
  }
  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: NewExpense((expense) => _addNewExpense(context, expense)),
      ),
    );
  }

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
            imagePath: widget.selectedItemIndex == 0
                ? 'assets/images/home_outlined.png'
                : 'assets/images/home.png',
            label: "Home",
            isSelected: widget.selectedItemIndex == 0,
            onClick: () {
              if (widget.selectedItemIndex != 0) { // Check if not already on Home
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }
            },
          ),
          BottomAppBarItem(
            imagePath: 'assets/images/add.png',
            label: "Add",
            isSelected: false,
            onClick: () {
              _openAddExpenseOverlay(context);
            },
          ),
          BottomAppBarItem(
            imagePath: widget.selectedItemIndex == 2
                ? 'assets/images/chart_selected.png'
                : 'assets/images/chart.png',
            label: "Chart",
            isSelected: widget.selectedItemIndex == 2,
            onClick: () {
              if (widget.selectedItemIndex != 2) { // Check if not already on Chart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChartScreen()),
                );
              }
            },
          ),
          BottomAppBarItem(
            imagePath: 'assets/images/user.png',
            label: "User",
            isSelected: false,
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
