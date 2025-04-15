import 'package:flutter/material.dart';

class ReportOverViewProvider extends ChangeNotifier {
  int totalStudents = 510;
  int newStudents = 102;
  int oldStudents = 408;

  int totalTarget = 55;
  int needToCollect = 10;
  int collectedAmount = 45;

  double get progress => (collectedAmount / totalTarget * 100) / 100;
}
