import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/pages/Authentication/signin_page.dart';
import 'package:qarz_app/services/prefs_service.dart';
import 'package:qarz_app/services/utils_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  // Sign in with Google
  // =============================================================================================================
  static Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential.user
    UserCredential userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
    User? user = userCredential.user;

    return user;
  }
  // =============================================================================================================

  // Sign up
  // =============================================================================================================
  static Future<User?> registerUsingEmailPassword(
      String name, String email, String password) async {
    User? user;

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      // await user.updateProfile(displayName: name);
      // await user.reload();
      // user = _auth.currentUser;
      print('AUTHSERVICE : User registered successfully.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.fireToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Utils.fireToast('The account already exists for that email.');
      }
    } catch (e) {
      Utils.fireToast(e.toString());
    }
    return user;
  }
  // =============================================================================================================

  // Sign in
  // =============================================================================================================
  static Future<User?> signInUsingEmailPassword(
      String email, String password) async {
    User? user;

    print('AUTHSERVICE : User logged in successfully.');
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.fireToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Utils.fireToast('Wrong password provided.');
      }
    }

    return user;
  }
  // =============================================================================================================

  static void signOutUser(BuildContext context) {
    _auth.signOut();
    Prefs.removeUserId().then((value) {
      Navigator.pushReplacementNamed(context, SignInPage.id);
    });
  }
}
