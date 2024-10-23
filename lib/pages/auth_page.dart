import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/pages/home_page.dart';
import '/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (contest, snapshot) {
          print("New Changes: $snapshot");
          if (snapshot.hasData) {
            print("User Data: ${snapshot.data}");

            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}