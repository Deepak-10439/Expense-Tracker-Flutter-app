import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// AuthServices class handles authentication operations using Firebase Auth
class AuthServices {

  /// Attempts to sign in the user with Google
  /// Returns true if successful, false otherwise
  Future<bool> signInWithGoogle() async {
    // Trigger the Google Sign-In flow
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // Obtain auth details from the request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Create a new credential for Firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Sign in to Firebase with the Google credential
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Return true if the user is not null (sign-in successful)
    return userCredential.user != null;
  }

  /// Signs in the user with email and password
  /// Returns true if successful, false otherwise
  Future<bool> signInWithEmailPassword(String email, String password) async {
    try {
      // Attempt to sign in with email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      // Print the error and return false if sign-in fails
      print(e);
      return false;
    }
  }

  /// Registers a new user with email and password
  /// Returns true if successful, false otherwise
  Future<bool> registerWithEmailPassword(String email, String password) async {
    try {
      // Attempt to create a new user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      // Print the error and return false if registration fails
      print(e);
      return false;
    }
  }

  /// Signs out the current user from Firebase and Google Sign-In
  /// Returns true if successful, false otherwise
  Future<bool> signOut() async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Disconnect and sign out from Google
      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      // Print error message and return false if sign-out fails
      print("Error while signout!");
      return false;
    }
  }
}
