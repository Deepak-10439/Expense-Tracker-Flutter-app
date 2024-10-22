class TransactionData {
  final String source;
  final double amount;
  final DateTime date; // Change from String to DateTime
  final String mode;
  final bool isIncome;
  final String category; 

  TransactionData({
    required this.source,
    required this.amount,
    required this.date, // Change from String to DateTime
    required this.mode,
    required this.isIncome,
    required this.category,
  });
}
