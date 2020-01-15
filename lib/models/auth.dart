import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {

  Map<String, String> _credentials = {};
  bool _isAuthenticated = false;

  Map<String, String> get credentials => _credentials;
  bool get isAuthenticated => _isAuthenticated;

  void authUser(Map<String, String> credentials) {
    _credentials = credentials;
    _isAuthenticated = true;
    notifyListeners();
  }

  void deauthUser() {
    _credentials = {};
    _isAuthenticated = false;
    notifyListeners();
  }

}