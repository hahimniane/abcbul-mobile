import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService extends ChangeNotifier {
  String? token;

  saveTokenToPrefs(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    this.token = token;
    notifyListeners();
  }

  Future<void> removeTokenFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    this.token = null;
    notifyListeners();
  }

  Future<String?> loadTokenFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.token = prefs.getString('token') ?? '';
    // Do not notify listeners here to avoid unnecessary rebuilds
    return prefs.getString('token') ?? null;
  }

  setToken(String inComingToken) {
    token = inComingToken;
    notifyListeners();
  }
}
