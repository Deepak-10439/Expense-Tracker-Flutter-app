import 'package:flutter/material.dart';
import 'models/transaction_repository.dart';
import 'models/transaction_data.dart';

// Data model to represent income and expense summary
class ExpenseSummaryData {
  final String type; // "Income" or "Expense"
  final double amount;

  ExpenseSummaryData({required this.type, required this.amount});
}

class IncomeExpenseSummary extends StatelessWidget {
  // Remove the data parameter
  const IncomeExpenseSummary({super.key});

  @override
  Widget build(BuildContext context) {
    // Get transactions from the repository
    final transactions = TransactionRepository().transactions;

    // Calculate total income and total expense
    final double totalIncome = transactions
        .where((transaction) => transaction.isIncome)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
    final double totalExpense = transactions
        .where((transaction) => !transaction.isIncome)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display Total Income
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Total Income",
                style: TextStyle(
                  color: Color(0xff90dc2c),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "₹ ${totalIncome.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Color(0xff90dc2c),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.1,
                  height: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(width: 32),
          // Display Total Expense
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Total Expense",
                style: TextStyle(
                  color: Color(0xffe57373),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "₹ ${totalExpense.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Color(0xffe57373),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.1,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Preview widget to test the IncomeExpenseSummary widget
class IncomeExpenseSummaryPreview extends StatelessWidget {
  const IncomeExpenseSummaryPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const IncomeExpenseSummary();
  }
}
