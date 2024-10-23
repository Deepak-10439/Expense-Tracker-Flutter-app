import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionData {
  final String id;
  final String source;
  final double amount;
  final DateTime date;
  final String mode;
  final bool isIncome;
  final String category;

  TransactionData({
    required this.id,
    required this.source,
    required this.amount,
    required this.date,
    required this.mode,
    required this.isIncome,
    required this.category,
  });

  factory TransactionData.fromMap(Map<String, dynamic> map, String id) {
    return TransactionData(
      id: id,
      source: map['source'],
      amount: map['amount'],
      date: (map['date'] as Timestamp).toDate(),
      mode: map['mode'],
      isIncome: map['isIncome'],
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'source': source,
      'amount': amount,
      'date': Timestamp.fromDate(date),
      'mode': mode,
      'isIncome': isIncome,
      'category': category,
    };
  }
}
