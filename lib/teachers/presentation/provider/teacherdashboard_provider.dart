import 'package:flutter/material.dart';

class TeacherdashboardProvider extends ChangeNotifier {
  int totalStudents = 32;
  int presentStudents = 28;

  int get absentStudents => totalStudents - presentStudents;
  double get attendancePercentage => (presentStudents / totalStudents) * 100;
}
