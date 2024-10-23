import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/services/auth_service.dart';
import '/pages/auth_page.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    user?.photoURL ?? 'https://via.placeholder.com/150',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              user?.displayName ?? "Welcome!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "You've successfully logged in with:",
              style: TextStyle(color: Colors.grey[600]),
            ),
            Text(
              user?.email ?? "N/A",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                if (await AuthServices.new().signOut()) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AuthPage()),
                  );
                }
              },
              child: Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
