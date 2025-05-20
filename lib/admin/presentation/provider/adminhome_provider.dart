import 'dart:async';

import 'package:flutter/material.dart';

class AdminhomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  double progress = 0.50; // Start at 1%
  double collectedAmount = 52;
  double goalAmount = 60;
  List<Map<String, dynamic>> _upcomingEvents = [];

  //getter
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  double? get progresscollect => collectedAmount / goalAmount;
  List<Map<String, dynamic>> get upcomingEvents => _upcomingEvents;

  List<Map<String, dynamic>> upcommingevents = [
    {
      'id': '1001',
      'eventname': 'Parent-Teacher meeting',
      'discription':
          'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
      'date': 'Parent-Teacher meeting',
      'time': 'Parent-Teacher meeting',
    },
    {
      'id': '1002',
      'eventname': 'Parent-Teacher meeting',
      'discription':
          'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
      'date': 'Parent-Teacher meeting',
      'time': 'Parent-Teacher meeting',
    },
    {
      'id': '1003',
      'eventname': 'Parent-Teacher meeting',
      'discription':
          'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
      'date': 'Parent-Teacher meeting',
      'time': 'Parent-Teacher meeting',
    },
    {
      'id': '1004',
      'eventname': 'Parent-Teacher meeting',
      'discription':
          'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
      'date': 'Parent-Teacher meeting',
      'time': 'Parent-Teacher meeting',
    },
    {
      'id': '1005',
      'eventname': 'Parent-Teacher meeting',
      'discription':
          'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
      'date': 'Parent-Teacher meeting',
      'time': 'Parent-Teacher meeting',
    },
  ];

  // AdminhomeProvider() {
  //   startProgress();
  // }

  Future<void> fetchUpcommingEvents() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));
    _upcomingEvents = [
      {
        'id': '1001',
        'eventname': 'Parent-Teacher meeting',
        'discription':
            'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
        'date': 'Parent-Teacher meeting',
        'time': 'Parent-Teacher meeting',
      },
      {
        'id': '1002',
        'eventname': 'Parent-Teacher meeting',
        'discription':
            'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
        'date': 'Parent-Teacher meeting',
        'time': 'Parent-Teacher meeting',
      },
      {
        'id': '1003',
        'eventname': 'Parent-Teacher meeting',
        'discription':
            'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
        'date': 'Parent-Teacher meeting',
        'time': 'Parent-Teacher meeting',
      },
      {
        'id': '1004',
        'eventname': 'Parent-Teacher meeting',
        'discription':
            'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
        'date': 'Parent-Teacher meeting',
        'time': 'Parent-Teacher meeting',
      },
      {
        'id': '1005',
        'eventname': 'Parent-Teacher meeting',
        'discription':
            'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
        'date': 'Parent-Teacher meeting',
        'time': 'Parent-Teacher meeting',
      },
    ];
    _isLoading = false;
    notifyListeners();
  }

  void updateCollectedAmount(double amount) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
    collectedAmount = amount;
    _isLoading = false;
    notifyListeners();
  }

  void startProgress() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      if (progress >= 1.0) {
        // Simulate network delay
        await Future.delayed(Duration(seconds: 2));
        timer.cancel();
      } else {
        progress += 0.01; // Increase by 1%
        _isLoading = false;
        notifyListeners();
      }
    });
  }
}
