import 'dart:developer';

import 'package:flutter/material.dart';

class EnrollStudentProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool _isFormSubmitLoading = false;

  bool get isFormSubmitLoading => _isFormSubmitLoading;
  String? get errorMessage => _errorMessage;
  int? _visibleIndex;

  int? get visibleIndex => _visibleIndex;
  bool get isloading => _isLoading;

  List<Map<String, dynamic>> _enrolledStudents = [];
  List<Map<String, dynamic>> get enrolledStudents => _enrolledStudents;

  void toggleVisibility(int index) {
    if (_visibleIndex == index) {
      _visibleIndex = null; // hide if clicked again
    } else {
      _visibleIndex = index; // show only this index
    }
    notifyListeners();
  }

  Future<void> fetchEnrolledStudent() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Perform authentication (API call, Firebase, etc.)
    await Future.delayed(Duration(seconds: 2));

    _enrolledStudents = [
      {
        'id': '101',
        'childname': 'John',
        'dob': '14-05-2025',
        'parentname': 'janedoe',
        'emailId': 'John@gmail.com',
        'phonenumber': '9656478736',
        'location': 'Springfield',
        'Program': 'Grade 5 – Class 5A',
      },
      {
        'id': '102',
        'childname': 'John',
        'dob': '14-05-2025',
        'parentname': 'janedoe',
        'emailId': 'John@gmail.com',
        'phonenumber': '9656478736',
        'location': 'Springfield',
        'Program': 'Grade 5 – Class 5A',
      },
      {
        'id': '103',
        'childname': 'John',
        'dob': '14-05-2025',
        'parentname': 'janedoe',
        'emailId': 'John@gmail.com',
        'phonenumber': '9656478736',
        'location': 'Springfield',
        'Program': 'Grade 5 – Class 5A',
      },
      {
        'id': '104',
        'childname': 'John',
        'dob': '14-05-2025',
        'parentname': 'janedoe',
        'emailId': 'John@gmail.com',
        'phonenumber': '9656478736',
        'location': 'Springfield',
        'Program': 'Grade 5 – Class 5A',
      },
      {
        'id': '105',
        'childname': 'John',
        'dob': '14-05-2025',
        'parentname': 'janedoe',
        'emailId': 'John@gmail.com',
        'phonenumber': '9656478736',
        'location': 'Springfield',
        'Program': 'Grade 5 – Class 5A',
      },
      {
        'id': '106',
        'childname': 'John',
        'dob': '14-05-2025',
        'parentname': 'janedoe',
        'emailId': 'John@gmail.com',
        'phonenumber': '9656478736',
        'location': 'Springfield',
        'Program': 'Grade 5 – Class 5A',
      },
    ];

    _isLoading = false;
    notifyListeners();
  }

  Future<void> newEnrollStudentSubmitFunction() async {
    _isFormSubmitLoading = true;
    notifyListeners();
    // Perform authentication (API call, Firebase, etc.)
    await Future.delayed(Duration(seconds: 2));
    // Replace with actual auth function
    _isFormSubmitLoading = false;
    notifyListeners();
  }
}
