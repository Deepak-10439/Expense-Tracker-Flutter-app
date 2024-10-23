import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/transaction_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Main entry point of the application
void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables from .env file
  await dotenv.load(fileName: ".env");
  
  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Run the app
  runApp(const MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Provide TransactionRepository to the widget tree
      create: (context) => TransactionRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // Set AuthPage as the initial route
        home: AuthPage(),
      ),
    );
  }
}
