import 'package:flutter/material.dart';

class ManageAdmissionProvider extends ChangeNotifier {
  bool _isacceptLoading = false;

  bool get isacceptLoading => _isacceptLoading;
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

  Future<void> acceptadmissionFunction() async {
    _isacceptLoading = true;
    notifyListeners();
    // Perform authentication (API call, Firebase, etc.)
    await Future.delayed(Duration(seconds: 2));
    // Replace with actual auth function
    _isacceptLoading = false;
    notifyListeners();
  }
}
