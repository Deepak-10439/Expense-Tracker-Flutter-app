import 'transaction_data.dart';

class TransactionRepository {
  static final TransactionRepository _instance = TransactionRepository._internal();

  factory TransactionRepository() {
    return _instance;
  }

  TransactionRepository._internal();

  final List<TransactionData> _transactions = [
    TransactionData(
      source: "Odunayo",
      amount: 400,
      date: "09 May, 2022",
      mode: "Credit",
      isIncome: true,
      category: "Salary",
    ),
    TransactionData(
      source: "Olayemi",
      amount: 200.45,
      date: "07 May, 2022",
      mode: "Transfer",
      isIncome: false,
      category: "Transfer",
    ),
    TransactionData(
      source: "Uber",
      amount: 36.45,
      date: "07 May, 2022",
      mode: "Debit Card",
      isIncome: false,
      category: "Transport",
    ),
    TransactionData(
      source: "Olayemi",
      amount: 200.45,
      date: "07 May, 2022",
      mode: "Transfer",
      isIncome: false,
      category: "Transfer",
    ),
    TransactionData(
      source: "Tasty Fried Chicken",
      amount: 50.32,
      date: "08 May, 2022",
      mode: "Debit Card",
      isIncome: false,
      category: "Food",
    ),
    TransactionData(
      source: "Nescafe",
      amount: 12.12,
      date: "09 May, 2022",
      mode: "Debit Card",
      isIncome: false,
      category: "Beverage",
    ),
    TransactionData(
      source: "Odunayo",
      amount: 400,
      date: "09 May, 2022",
      mode: "Credit",
      isIncome: true,
      category: "Salary",
    ),
    TransactionData(
      source: "Olayemi",
      amount: 200.45,
      date: "07 May, 2022",
      mode: "Transfer",
      isIncome: false,
      category: "Transfer",
    ),
    TransactionData(
      source: "Tasty Fried Chicken",
      amount: 50.32,
      date: "08 May, 2022",
      mode: "Debit Card",
      isIncome: false,
      category: "Food",
    ),
    TransactionData(
      source: "Nescafe",
      amount: 12.12,
      date: "09 May, 2022",
      mode: "Debit Card",
      isIncome: false,
      category: "Beverage",
    ),
    TransactionData(
      source: "Odunayo",
      amount: 400,
      date: "09 May, 2022",
      mode: "Credit",
      isIncome: true,
      category: "Salary",
    ),
  ];

  List<TransactionData> get transactions => _transactions;
}
