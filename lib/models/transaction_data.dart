import 'package:cloud_firestore/cloud_firestore.dart';

// Model class for transaction data
class TransactionData {
  final String id;
  final String source;
  final double amount;
  final DateTime date;
  final String mode;
  final bool isIncome;
  final String category;

  // Constructor
  TransactionData({
    required this.id,
    required this.source,
    required this.amount,
    required this.date,
    required this.mode,
    required this.isIncome,
    required this.category,
  });

  // Factory constructor to create TransactionData from Firestore document
  factory TransactionData.fromMap(Map<String, dynamic> map, String id) {
    return TransactionData(
      id: id,
      source: map['source'],
      amount: (map['amount'] as num).toDouble(),
      date: (map['date'] as Timestamp).toDate(),
      mode: map['mode'],
      isIncome: map['isIncome'],
      category: map['category'],
    );
  }

  // Convert TransactionData to a Map for Firestore storage
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
