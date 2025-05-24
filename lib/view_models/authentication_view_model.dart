import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app_coding_test/services/authentication_service.dart';

class AuthenticationViewModel extends ChangeNotifier {
  final AuthenticationService authenticationService = AuthenticationService();
  User? _user;

  User? get user => _user;

  Future<void> googleSignIn() async {
    _user = await authenticationService.signInWithGoogle();
    notifyListeners();
  }

  Future<void> signOut() async {
    await authenticationService.signOut();
    _user = null;
    notifyListeners();
  }
}
