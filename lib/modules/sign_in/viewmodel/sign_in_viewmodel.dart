import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninViewmodel extends ChangeNotifier {
  User? _user;
  User get user => _user!;

  String? error;
  bool isLoading = false;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signInWithGoogle() async {
    _setLoading(true);
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) return false;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      _user = userCredential.user;
      _setLoading(false);
      return true;
    } catch (e) {
      error = e.toString();
      log('ERROR:${e.toString()}');
      _setLoading(false);
      return false;
    }
  }

  Future<bool> signInWithGithub() async {
    try {
      GithubAuthProvider githubAuthProvider = GithubAuthProvider();
      UserCredential userCredential =
          await _auth.signInWithProvider(githubAuthProvider);
      _user = userCredential.user;
      return true;
    } catch (e) {
      error = e.toString();
      log('ERROR:${e.toString()}');
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
