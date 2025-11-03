import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Global notifier — drives rebuilds across the app
ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// 🔹 Sign In
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // ✅ Notify the app that auth changed
    authService.value = AuthService();
    return userCredential;
  }

  /// 🔹 Sign Up
  Future<UserCredential> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // ✅ Wait for Firebase to fully register the new user
    await userCredential.user?.updateDisplayName(fullName);
    await userCredential.user?.reload();

    // ✅ Notify app once Firebase is consistent
    authService.value = AuthService();

    return userCredential;
  }

  /// 🔹 Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    // ✅ Make sure ValueNotifier updates
    authService.value = AuthService();
  }

  /// 🔹 Password reset
  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  /// 🔹 Update display name
  Future<void> updateUsername({required String displayName}) async {
    await _auth.currentUser?.updateDisplayName(displayName);
    await _auth.currentUser?.reload();
    authService.value = AuthService();
  }

  /// 🔹 Delete account (with reauth)
  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await _auth.currentUser?.reauthenticateWithCredential(credential);
    await _auth.currentUser?.delete();
    await signOut();
  }

  /// 🔹 Change password
  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    final credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await _auth.currentUser?.reauthenticateWithCredential(credential);
    await _auth.currentUser?.updatePassword(newPassword);
  }
}
