import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Logger logger = Logger();

  // Show loading indicator
  void showLoading() {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  // Hide loading indicator
  void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  // Create a new user account
  Future<void> createAccount(String email, String password) async {
    try {
      showLoading(); // Show loading
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      hideLoading(); // Hide loading
    } on FirebaseAuthException catch (e) {
      hideLoading();
      _handleFirebaseError(e);
    } catch (e) {
      hideLoading();
      logger.e(e.toString());
      Get.snackbar("Error", "Something went wrong. Please try again.");
    }
  }

  // Login existing user
  Future<void> login(String email, String password) async {
    try {
      showLoading(); // Show loading
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      hideLoading(); // Hide loading
      Get.offAllNamed('/main-screen', arguments: _auth.currentUser);
    } on FirebaseAuthException catch (e) {
      hideLoading();
      _handleFirebaseError(e);
    } catch (e) {
      hideLoading();
      logger.e(e.toString());
      Get.snackbar("Error", "Something went wrong. Please try again.");
    }
  }

  // Logout user
  Future<void> logOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed("/");
    } catch (e) {
      logger.e(e.toString());
      Get.snackbar("Error", "Failed to logout. Please try again.");
    }
  }

  // Handle Firebase authentication errors
  void _handleFirebaseError(FirebaseAuthException e) {
    logger.e(e.toString());

    String message;
    switch (e.code) {
      case 'user-not-found':
        message = "No user found for that email.";
        break;
      case 'wrong-password':
        message = "Incorrect password. Please try again.";
        break;
      case 'email-already-in-use':
        message = "This email is already in use.";
        break;
      case 'weak-password':
        message = "Password is too weak. Choose a stronger one.";
        break;
      case 'invalid-email':
        message = "Invalid email address.";
        break;
      default:
        message = "An unexpected error occurred.";
    }

    Get.snackbar("Authentication Error", message);
  }
}
