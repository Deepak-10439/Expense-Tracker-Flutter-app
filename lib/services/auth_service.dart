import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {

  Future<bool> signInWithGoogle() async {
    
    final GoogleSignInAccount? gUSer = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUSer!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user != null;
  }

  Future<bool> signInWithEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registerWithEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      print("Error while signout!");
      return false;
    }
  }
}
