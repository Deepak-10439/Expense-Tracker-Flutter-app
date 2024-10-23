import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pieChart.dart'; 
import 'expenseSummary.dart'; 
import 'dailyMonthlyWeeklyFrame.dart'; 
import 'Bottombar.dart';
import 'new_expense.dart';
import 'models/expenses.dart';
import 'models/transaction_repository.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch transactions when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TransactionRepository>(context, listen: false).fetchTransactions();
    });
  }

  void _addNewExpense(BuildContext context, Expense newExpense) {
    // Implement the logic to add the new expense
    // For example, you might want to update a list or database
  }

  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: NewExpense((expense) => _addNewExpense(context, expense)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(selectedItemIndex: 2,),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  // Handle back navigation
                },
              ),
              const Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3F3F3F),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _openAddExpenseOverlay(context),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const DailyMonthlyWeeklyFrame(),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<TransactionRepository>(
                    builder: (context, transactionRepo, child) {
                      return IncomeExpenseSummary();
                    },
                  ),
                  Consumer<TransactionRepository>(
                    builder: (context, transactionRepo, child) {
                      return PieChartPreview();
                    },
                  ),
                ],
              )
            )
          ),
        ],
      ),
    );
  }
}
