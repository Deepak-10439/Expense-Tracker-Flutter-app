import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/transaction_data.dart';
import 'models/transaction_repository.dart';
import 'models/expenses.dart';

class EditTransactionScreen extends StatefulWidget {
  final TransactionData transaction;

  const EditTransactionScreen({Key? key, required this.transaction}) : super(key: key);

  @override
  _EditTransactionScreenState createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  late TextEditingController _titleController;
  late TextEditingController _amountController;
  late DateTime _selectedDate;
  late String _selectedCategory;
  late bool _isIncome;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.transaction.source);
    _amountController = TextEditingController(text: widget.transaction.amount.toString());
    _selectedDate = widget.transaction.date;
    _selectedCategory = widget.transaction.category;
    _isIncome = widget.transaction.isIncome;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitChanges() {
    final enteredAmount = double.tryParse(_amountController.text);
    if (_titleController.text.isEmpty || enteredAmount == null || enteredAmount <= 0) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid title and amount')),
      );
      return;
    }

    final updatedTransaction = TransactionData(
      id: widget.transaction.id,
      source: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate,
      mode: _isIncome ? "Income" : "Expense",
      isIncome: _isIncome,
      category: _selectedCategory,
    );

    // Update the transaction in the repository
    Provider.of<TransactionRepository>(context, listen: false).updateTransaction(updatedTransaction);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Transaction'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Date: ${formatter.format(_selectedDate)}',
                  ),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text('Change Date'),
                ),
              ],
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedCategory,
              items: [
                ...Category.values.map((category) => DropdownMenuItem(
                      value: category.name,
                      child: Text(category.name),
                    )),
                DropdownMenuItem(value: 'Income', child: Text('Income')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedCategory = value;
                    _isIncome = value == 'Income';
                  });
                }
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitChanges,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
