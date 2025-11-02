import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    // Create user with email & password
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update the user’s display name in Firebase Auth profile
    await userCredential.user?.updateDisplayName(fullName);
    await userCredential.user?.reload();

    return userCredential;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUsername({required String displayName}) async {
    await _auth.currentUser?.updateDisplayName(displayName);
  }

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    // Re-authenticate the user
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await _auth.currentUser?.reauthenticateWithCredential(credential);

    // Delete the user account
    await _auth.currentUser?.delete();
    await signOut();
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await _auth.currentUser?.reauthenticateWithCredential(credential);
    await _auth.currentUser?.updatePassword(newPassword);
  }
}
