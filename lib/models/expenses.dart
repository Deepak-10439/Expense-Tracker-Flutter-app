import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Formatter for date display
final formatter = DateFormat.yMd();
// UUID generator for unique IDs
const uuid = Uuid();

// Enum for expense categories
enum Category { food, travel, work, grocery, shopping, rent, bills, other }

// Map of category icons
const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  // TODO: Add icons for other categories
};

// Expense model class
class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // Constructor with auto-generated ID
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  // Getter for formatted date
  String get formattedDate {
    return formatter.format(date);
  }
}

// Class for grouping expenses by category
class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  const ExpenseBucket({required this.category, required this.expenses});

  // Named constructor to create a bucket for a specific category
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  // Getter to calculate total expenses in the bucket
  double get totalExpenses {
    double total = 0;
    for (final expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}
