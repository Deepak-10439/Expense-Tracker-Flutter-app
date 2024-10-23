import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'transaction_data.dart';

class TransactionRepository extends ChangeNotifier {
  static final TransactionRepository _instance = TransactionRepository._internal();

  factory TransactionRepository() {
    return _instance;
  }

  TransactionRepository._internal();

  final CollectionReference _transactionsCollection = FirebaseFirestore.instance.collection('transactions');

  List<TransactionData> _transactions = [];

  List<TransactionData> get transactions => _transactions;

  Future<void> fetchTransactions() async {
    try {
      QuerySnapshot querySnapshot = await _transactionsCollection.orderBy('date', descending: true).get();
      print('Fetched ${querySnapshot.docs.length} documents');
      _transactions = querySnapshot.docs.map((doc) {
        print('Document data: ${doc.data()}');
        return TransactionData.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
      print('Parsed ${_transactions.length} transactions');
      notifyListeners();
    } catch (e) {
      print('Error fetching transactions: $e');
    }
  }

  Future<void> addTransaction(TransactionData transaction) async {
    try {
      await _transactionsCollection.add(transaction.toMap());
      await fetchTransactions();
    } catch (e) {
      print('Error adding transaction: $e');
    }
  }

  Future<void> updateTransaction(TransactionData transaction) async {
    try {
      await _transactionsCollection.doc(transaction.id).update(transaction.toMap());
      await fetchTransactions();
    } catch (e) {
      print('Error updating transaction: $e');
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      await _transactionsCollection.doc(id).delete();
      await fetchTransactions();
    } catch (e) {
      print('Error deleting transaction: $e');
    }
  }

  Future<void> addDummyTransactions() async {
    for (var transaction in dummyTransactions) {
      await addTransaction(transaction);
    }
  }
}

List<TransactionData> dummyTransactions = [
  TransactionData(
    id: '',
    source: 'Salary',
    amount: 5000.00,
    date: DateTime.now().subtract(const Duration(days: 2)),
    mode: 'Bank Transfer',
    isIncome: true,
    category: 'Income',
  ),
  TransactionData(
    id: '',
    source: 'Groceries',
    amount: 150.50,
    date: DateTime.now().subtract(const Duration(days: 1)),
    mode: 'Credit Card',
    isIncome: false,
    category: 'Food',
  ),
  TransactionData(
    id: '',
    source: 'Uber',
    amount: 25.00,
    date: DateTime.now(),
    mode: 'Debit Card',
    isIncome: false,
    category: 'Transportation',
  ),
  TransactionData(
    id: '',
    source: 'Freelance Work',
    amount: 500.00,
    date: DateTime.now().subtract(const Duration(days: 3)),
    mode: 'PayPal',
    isIncome: true,
    category: 'Income',
  ),
  TransactionData(
    id: '',
    source: 'Restaurant',
    amount: 75.20,
    date: DateTime.now().subtract(const Duration(days: 2)),
    mode: 'Cash',
    isIncome: false,
    category: 'Food',
  ),
];
