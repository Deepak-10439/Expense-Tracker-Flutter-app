// ignore: file_names
import 'package:flutter/material.dart';
import 'models/transaction_repository.dart';
import 'models/transaction_data.dart';

// Data class for expense data
class ExpenseData {
  final String name;
  final double amount;

  ExpenseData(this.name, this.amount);
  
  // Static method to filter and summarize expenses from transactions
  static List<ExpenseData> fromTransactions(List<TransactionData> transactions) {
    final Map<String, double> expenseMap = {};

    // Iterate through each transaction
    for (var transaction in transactions) {
      // Filter out only expenses (where isIncome is false)
      if (!transaction.isIncome) {
        // Summarize amounts by source
        if (expenseMap.containsKey(transaction.source)) {
          expenseMap[transaction.source] = expenseMap[transaction.source]! + transaction.amount;
        } else {
          expenseMap[transaction.source] = transaction.amount;
        }
      }
    }

    // Convert the map into a list of ExpenseData
    return expenseMap.entries
        .map((entry) => ExpenseData(entry.key, entry.value))
        .toList();
  }
}
// PieChart widget
class PieChart extends StatelessWidget {
  final List<ExpenseData> data;
  final double size;

  const PieChart({super.key, required this.data, this.size = 240.0});

  @override
  Widget build(BuildContext context) {
    // Calculate the total sum of all expenses
    final total = data.fold(0.0, (sum, item) => sum + item.amount);
    // List of colors for the slices
    const colors = [
      Color(0xFF1F77B4), Color(0xFFFF7F0E), Color(0xFF2CA02C), Color(0xFFD62728),
      Color(0xFF9467BD), Color(0xFF8C564B), Color(0xFFE377C2), Color(0xFF7F7F7F),
      Color(0xFFBCBD22), Color(0xFF17BECF), Color(0xFFAEC7E8), Color(0xFFFFBB78),
      Color(0xFF98DF8A), Color(0xFFFF9896), Color(0xFFC5B0D5), Color(0xFFC49C94),
      Color(0xFFF7B6D2), Color(0xFFC7C7C7), Color(0xFFDBDB8D), Color(0xFF9EDAE5),
      Color(0xFF393B79), Color(0xFF637939), Color(0xFF8C6D31), Color(0xFF843C39),
      Color(0xFF7B4173), Color(0xFFB5CF6B), Color(0xFFCEDB9C), Color(0xFF8C6D31),
      Color(0xFFBD9E39), Color(0xFF6B6ECF), Color(0xFF9C9EDE), Color(0xFFCEDB9C),
      Color(0xFFE7BA52), Color(0xFFE7CB94), Color(0xFFE7969C), Color(0xFFDE9ED6),
      Color(0xFF7B4173), Color(0xFFA55194), Color(0xFFCE6DBD), Color(0xFF9C9EDE),
      Color(0xFFD6616B), Color(0xFFE7969C), Color(0xFFCE6DBD), Color(0xFFDE9ED6),
      Color(0xFFA55194), Color(0xFF7B4173), Color(0xFF8C6D31), Color(0xFFBD9E39),
      Color(0xFFE7BA52)
    ];

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: PieChartPainter(data: data, total: total, colors: colors),
      ),
    );
  }
}

// Custom painter for the pie chart
class PieChartPainter extends CustomPainter {
  final List<ExpenseData> data;
  final double total;
  final List<Color> colors;

  PieChartPainter({required this.data, required this.total, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = 0.0;

    for (int i = 0; i < data.length; i++) {
      final sweepAngle = (data[i].amount / total) * 2 * 3.141592653589793; // 2 * π

      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromLTWH(0, 0, size.width, size.height),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// PieChartWithLabels widget
class PieChartWithLabels extends StatelessWidget {
  final List<ExpenseData> data;
  final List<Color> colors;

  const PieChartWithLabels({super.key, required this.data, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PieChart(data: data),
            const SizedBox(height: 24),
            for (int index = 0; index < data.length; index++) ...[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(9),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: colors[index % colors.length],
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[index].name,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '₹${data[index].amount}',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}

// Preview widget
class PieChartPreview extends StatelessWidget {
  const PieChartPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionData = TransactionRepository().transactions;
    final sampleData = ExpenseData.fromTransactions(transactionData);
    const colors = [
      Color(0xFF1F77B4), Color(0xFFFF7F0E), Color(0xFF2CA02C), Color(0xFFD62728),
      Color(0xFF9467BD), Color(0xFF8C564B), Color(0xFFE377C2), Color(0xFF7F7F7F),
      Color(0xFFBCBD22), Color(0xFF17BECF), Color(0xFFAEC7E8), Color(0xFFFFBB78),
      Color(0xFF98DF8A), Color(0xFFFF9896), Color(0xFFC5B0D5), Color(0xFFC49C94),
      Color(0xFFF7B6D2), Color(0xFFC7C7C7), Color(0xFFDBDB8D), Color(0xFF9EDAE5),
      Color(0xFF393B79), Color(0xFF637939), Color(0xFF8C6D31), Color(0xFF843C39),
      Color(0xFF7B4173), Color(0xFFB5CF6B), Color(0xFFCEDB9C), Color(0xFF8C6D31),
      Color(0xFFBD9E39), Color(0xFF6B6ECF), Color(0xFF9C9EDE), Color(0xFFCEDB9C),
      Color(0xFFE7BA52), Color(0xFFE7CB94), Color(0xFFE7969C), Color(0xFFDE9ED6),
      Color(0xFF7B4173), Color(0xFFA55194), Color(0xFFCE6DBD), Color(0xFF9C9EDE),
      Color(0xFFD6616B), Color(0xFFE7969C), Color(0xFFCE6DBD), Color(0xFFDE9ED6),
      Color(0xFFA55194), Color(0xFF7B4173), Color(0xFF8C6D31), Color(0xFFBD9E39),
      Color(0xFFE7BA52)
    ];
    return Center(
        child: PieChartWithLabels(data: sampleData, colors: colors),
      );
  }
}
