import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:schoolmanagment/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool _isloginLoading = false;

  String? _errorLoginmessage;

  bool _isVisible = false;

  bool get isLogingLoading => _isloginLoading;
  String? get errorLoginMessage => _errorLoginmessage;
  bool get isVidible => _isVisible;

  final List<UserModel> _users = [
    UserModel(
      username: 'admin',
      password: '12345',
      role: 'admin',
      email: 'admin@example.com',
    ),
    UserModel(
      username: 'teacher',
      password: '12345',
      role: 'teacher',
      email: 'teacher@example.com',
    ),
    UserModel(
      username: 'parent',
      password: '12345',
      role: 'parent',
      email: 'parent@example.com',
    ),
  ];

  UserModel? _loggedInUser;

  UserModel? get loggedInUser => _loggedInUser;

  void setLoggingLoading(bool value) {
    _isloginLoading = value;
    notifyListeners();
  }

  void isVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
    print(isVidible);
  }

  Future<void> loginFunction(
    BuildContext context,
    // String? role,
    String? username,
    String? password,
  ) async {
    if (username == null ||
        password == null ||
        username.isEmpty ||
        password.isEmpty) {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all fields")));
      return;
    }
    _isloginLoading = true;
    notifyListeners();
    // Perform authentication (API call, Firebase, etc.)
    bool isAuthenticated = await authenticateUser(
      username,
      password,
    ); // Replace with actual auth function
    _isloginLoading = false;
    notifyListeners();
    if (isAuthenticated && _loggedInUser != null) {
      // Redirect based on role
      await saveUserCredentials(_loggedInUser!.role, _loggedInUser!.username);
      Navigator.pushReplacementNamed(
        context,
        '/bottomnavbarwidget',
        arguments: {'role': _loggedInUser!.role},
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid username or password")));
    }
    notifyListeners();
  }

  // ✅ Check user match
  Future<bool> authenticateUser(String username, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate API delay

    for (UserModel user in _users) {
      if (user.username == username && user.password == password) {
        _loggedInUser = user;
        return true;
      }
    }
    return false;
  }

  Future<void> saveUserCredentials(String role, String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
    await prefs.setString('username', username);
  }

  Future<void> logout() async {
    _isloginLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('role');
    await prefs.remove('username');
    _isloginLoading = false;
    notifyListeners();
  }
}
