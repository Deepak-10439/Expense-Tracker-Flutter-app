import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/services/auth_service.dart';


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
                    user!.photoURL.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              user!.displayName.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Welcome, you have successfully logged in with",
              style: TextStyle(color: Colors.grey[600]),
            ),
            Text(
              user!.providerData[0].email.toString(),
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () async {
                if (await AuthServices.new().signOut()) {}
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}