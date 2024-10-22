   import 'package:flutter/material.dart';
   import 'package:provider/provider.dart';
   import 'models/transaction_repository.dart';
   import 'homeScreen.dart';

   void main() {
     runApp(
       MultiProvider(
         providers: [
           ChangeNotifierProvider(create: (_) => TransactionRepository()),
         ],
         child: MyApp(),
       ),
     );
   }

   class MyApp extends StatelessWidget {
    const MyApp({super.key});

     @override
     Widget build(BuildContext context) {
       return const MaterialApp(
         home: HomeScreen(),
       );
     }
   }