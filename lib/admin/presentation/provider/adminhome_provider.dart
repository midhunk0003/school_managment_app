import 'dart:async';

import 'package:flutter/material.dart';

class AdminhomeProvider extends ChangeNotifier {
  double progress = 0.50; // Start at 1%
  double collectedAmount = 52;
  double goalAmount = 60;
  double? get progresscollect => collectedAmount / goalAmount;
  // AdminhomeProvider() {
  //   startProgress();
  // }

  void updateCollectedAmount(double amount) {
    collectedAmount = amount;
    notifyListeners();
  }

  void startProgress() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (progress >= 1.0) {
        timer.cancel();
      } else {
        progress += 0.01; // Increase by 1%
        notifyListeners();
      }
    });
  }
}
