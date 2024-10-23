import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CardDetails.dart';
import 'expensedetails.dart';
import 'Bottombar.dart';
import 'models/transaction_repository.dart';
import 'models/transaction_data.dart';
import 'edit_transaction_screen.dart';
import 'package:intl/intl.dart'; // Make sure to import this for date formatting

class HomeScreen extends StatefulWidget {
  final Function(NavigatorState)? navController;

  const HomeScreen({super.key, this.navController});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TransactionRepository>(context, listen: false).fetchTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransactionRepository(),
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/menu_03.png',
                      width: 40,
                      height: 25,
                    ),
                  ),
                ),
                const Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3F3F3F),
                    letterSpacing: 0.1,
                  ),
                ),
                Container(), // Empty Box equivalent for alignment
              ],
            ),
            const SizedBox(height: 30), // Spacer equivalent
            const Stack(
              children: [
                Positioned(
                  child: CardFrame(
                    backgroundColor: Color(0xBDAFADAD),
                    rotationZ: 7.0,
                    width: 334.0,
                    height: 175.0,
                  ),
                ),
                Positioned(
                  child: CardFrame(
                    backgroundColor:  Color(0xBDAFADAD),
                    rotationZ: -7.0,
                    width: 334.0,
                    height: 175.0,
                  ),
                ),
                Positioned(
                  child: CardFrame(
                    backgroundColor:  Color(0xFFF3F3F3),
                    rotationZ: 0.0,
                    width: 334.0,
                    height: 175.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Spacer equivalent
            Expanded(
               child: Consumer<TransactionRepository>(
                 builder: (context, transactionRepo, child) {
                   return Column(
                     children: [
                       const Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Padding(
                             padding: EdgeInsets.only(left: 25.0),
                             child: Text(
                               "Recent Activity",
                               style: TextStyle(
                                 fontSize: 16.0,
                                 fontWeight: FontWeight.w600,
                                 color: Color(0xFF3F3F3F),
                                 letterSpacing: 0.1,
                               ),
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(right: 25.0),
                             child: Text(
                               "View All",
                               style: TextStyle(
                                 fontSize: 16.0,
                                 fontWeight: FontWeight.w600,
                                 color: Color(0xFF575757),
                                 letterSpacing: 0.1,
                               ),
                             ),
                           ),
                         ],
                       ),
                       Expanded(
                         child: TransactionsList(),
                       ),
                     ],
                   );
                 },
               ),
             ),
          ],
        ),
        bottomNavigationBar: const BottomBar(selectedItemIndex: 0,),
      ),
    );
  }
}

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionRepository>(
      builder: (context, transactionRepo, child) {
        if (transactionRepo.transactions.isEmpty) {
          return Center(child: Text('No transactions yet'));
        }
        return ListView.builder(
          itemCount: transactionRepo.transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactionRepo.transactions[index];
            return Dismissible(
              key: Key(transaction.id),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (direction) {
                transactionRepo.deleteTransaction(transaction.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Transaction deleted'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        transactionRepo.addTransaction(transaction);
                      },
                    ),
                  ),
                );
              },
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm"),
                      content: Text("Are you sure you want to delete this transaction?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: InkWell(
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTransactionScreen(transaction: transaction),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.source,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              transaction.mode,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${transaction.isIncome ? '+' : '-'}₹${transaction.amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: transaction.isIncome ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            DateFormat('dd MMM, yyyy').format(transaction.date),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
