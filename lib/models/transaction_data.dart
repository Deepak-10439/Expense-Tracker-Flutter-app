class TransactionData {
  final String source;
  final double amount;
  final String date;
  final String mode;
  final bool isIncome;
  final String category; 

  TransactionData({
    required this.source,
    required this.amount,
    required this.date,
    required this.mode,
    required this.isIncome,
    required this.category,
  });
}
