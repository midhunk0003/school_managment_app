import 'package:flutter/material.dart';

class EnrollStudentProvider extends ChangeNotifier {
  bool _isFormSubmitLoading = false;

  bool get isFormSubmitLoading => _isFormSubmitLoading;
  int? _visibleIndex;

  int? get visibleIndex => _visibleIndex;

  void toggleVisibility(int index) {
    if (_visibleIndex == index) {
      _visibleIndex = null; // hide if clicked again
    } else {
      _visibleIndex = index; // show only this index
    }
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
