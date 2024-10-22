import 'package:flutter/material.dart';

// Data class equivalent in Dart
class TransactionData {
  final String source;
  final String amount;
  final String date;
  final String mode;
  final bool isIncome;

  TransactionData({
    required this.source,
    required this.amount,
    required this.date,
    required this.mode,
    required this.isIncome,
  });
}

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
          const SizedBox(height: 8.0),
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
        return Column(
          children: [
            TransactionItem(
              source: transaction.source,
              amount: transaction.amount,
              date: transaction.date,
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
    final sampleTransactions = [
      TransactionData(source: "Odunayo", amount: "400", date: "09 May, 2022", mode: "Credit", isIncome: true),
      TransactionData(source: "Olayemi", amount: "200.45", date: "07 May, 2022", mode: "Transfer", isIncome: false),
      TransactionData(source: "Tasty Fried Chicken", amount: "50.32", date: "08 May, 2022", mode: "Debit Card", isIncome: false),
      TransactionData(source: "Nescafe", amount: "12.12", date: "09 May, 2022", mode: "Debit Card", isIncome: false),
      TransactionData(source: "Odunayo", amount: "400", date: "09 May, 2022", mode: "Credit", isIncome: true),
      TransactionData(source: "Olayemi", amount: "200.45", date: "07 May, 2022", mode: "Transfer", isIncome: false),
      TransactionData(source: "Tasty Fried Chicken", amount: "50.32", date: "08 May, 2022", mode: "Debit Card", isIncome: false),
      TransactionData(source: "Nescafe", amount: "12.12", date: "09 May, 2022", mode: "Debit Card", isIncome: false),
      TransactionData(source: "Odunayo", amount: "400", date: "09 May, 2022", mode: "Credit", isIncome: true),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: Column(
        children: [
          // Other widgets can be added here if needed
          Expanded(
            child: TransactionsList(transactions: sampleTransactions),
          ),
        ],
      ),
    );
  }
}



