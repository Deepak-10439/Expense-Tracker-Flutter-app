import 'package:flutter/foundation.dart';
import 'transaction_data.dart';

class TransactionRepository extends ChangeNotifier {
  static final TransactionRepository _instance = TransactionRepository._internal();

  factory TransactionRepository() {
    return _instance;
  }

  TransactionRepository._internal();

  final List<TransactionData> _transactions = [
    TransactionData(
      source: "Odunayo",
      amount: 400,
      date: DateTime.parse("2022-05-09"),
      mode: "Credit",
      isIncome: true,
      category: "Salary",
    ),
    TransactionData(
      source: "Olayemi",
      amount: 200.45,
      date: DateTime.parse("2022-05-07"),
      mode: "Transfer",
      isIncome: false,
      category: "Transfer",
    ),
    TransactionData(
      source: "Uber",
      amount: 36.45,
      date: DateTime.parse("2022-05-07"),
      mode: "Debit Card",
      isIncome: false,
      category: "Transport",
    ),
    TransactionData(
      source: "Olayemi",
      amount: 200.45,
      date: DateTime.parse("2022-05-07"),
      mode: "Transfer",
      isIncome: false,
      category: "Transfer",
    ),
    TransactionData(
      source: "Tasty Fried Chicken",
      amount: 50.32,
      date: DateTime.parse("2022-05-08"),
      mode: "Debit Card",
      isIncome: false,
      category: "Food",
    ),
    TransactionData(
      source: "Nescafe",
      amount: 12.12,
      date: DateTime.parse("2022-05-09"),
      mode: "Debit Card",
      isIncome: false,
      category: "Beverage",
    ),
    TransactionData(
      source: "Odunayo",
      amount: 400,
      date: DateTime.parse("2022-05-09"),
      mode: "Credit",
      isIncome: true,
      category: "Salary",
    ),
    TransactionData(
      source: "Olayemi",
      amount: 200.45,
      date: DateTime.parse("2022-05-07"),
      mode: "Transfer",
      isIncome: false,
      category: "Transfer",
    ),
    TransactionData(
      source: "Tasty Fried Chicken",
      amount: 50.32,
      date: DateTime.parse("2022-05-08"),
      mode: "Debit Card",
      isIncome: false,
      category: "Food",
    ),
    TransactionData(
      source: "Nescafe",
      amount: 12.12,
      date: DateTime.parse("2022-05-09"),
      mode: "Debit Card",
      isIncome: false,
      category: "Beverage",
    ),
    TransactionData(
      source: "Odunayo",
      amount: 400,
      date: DateTime.parse("2022-05-09"),
      mode: "Credit",
      isIncome: true,
      category: "Salary",
    ),
  ];

  List<TransactionData> get transactions => _transactions;

  void addTransaction(TransactionData transaction) {
    _transactions.add(transaction);
    _transactions.sort((a, b) => b.date.compareTo(a.date)); // Sort by DateTime descending
    notifyListeners();
  }
}
