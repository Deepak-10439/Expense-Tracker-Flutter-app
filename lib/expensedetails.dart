import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'models/transaction_data.dart'; // Import the new data class
import 'models/transaction_repository.dart';

// Transaction Item Widget
class TransactionItem extends StatelessWidget {
  final String source;
  final String amount;
  final String date;
  final String mode;
  final bool isIncome;

  const TransactionItem({
    super.key,
    required this.source,
    required this.amount,
    required this.date,
    required this.mode,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xfff3f3f3),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row for source and amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                source,
                style: const TextStyle(
                  color: Color(0xff3f3f3f),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
              Text(
                isIncome ? "+₹$amount" : "-₹$amount",
                style: TextStyle(
                  color: isIncome
                      ? const Color(0xff90dc2c)
                      : const Color(0xffea2525),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
          // Row for date and mode
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mode,
                style: const TextStyle(
                  color: Color(0xff575757),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  color: Color(0xff575757),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Update the TransactionsList widget to use a ListView.builder for better performance
class TransactionsList extends StatelessWidget {
  final List<TransactionData> transactions;

  const TransactionsList({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8.0),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        final formattedDate = DateFormat('yyyy-MM-dd').format(transaction.date); // Format the date
        return Column(
          children: [
            TransactionItem(
              source: transaction.source,
              amount: transaction.amount.toString(),
              date: formattedDate, // Use the formatted date
              mode: transaction.mode,
              isIncome: transaction.isIncome,
            ),
            const SizedBox(height: 11.0), // Space between items
          ],
        );
      },
    );
  }
}

class TransactionsListPreview extends StatelessWidget {
  const TransactionsListPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = TransactionRepository().transactions;

    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: Column(
        children: [
          // Other widgets can be added here if needed
          Expanded(
            child: TransactionsList(transactions: transactions),
          ),
        ],
      ),
    );
  }
}



