import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolmanagment/teachers/data/mark_attendance_model.dart';

class MarkAttendanceProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isSubmitted = false; // NEW VARIABLE
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  DateTime _selectedDate = DateTime.now();
  DateTime _todayDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  DateTime get todayDate => _todayDate;
  bool get isSubmitted => _isSubmitted;

  final List<StudentAttendance> _allStudentAttendance = [
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '001',
      className: '10A',
      isMarked: true,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '002',
      className: '10A',
      isMarked: true,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '003',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '004',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '005',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '006',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '007',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '008',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '009',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-01',
      id: '010',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-10',
      id: '011',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-10',
      id: '012',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-11',
      id: '011',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
    StudentAttendance(
      name: 'roli',
      date: '2025-04-11',
      id: '012',
      className: '10A',
      isMarked: false,
      status: 'present',
    ),
  ];

  void updateSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  List<StudentAttendance> get studentAttendance {
    return _allStudentAttendance.where((student) {
      return student.date == DateFormat('yyyy-MM-dd').format(_selectedDate);
    }).toList();
  }

  int get totalStudents => studentAttendance.length;
  int get markedCount => studentAttendance.where((s) => s.isMarked).length;
  int get presentCount =>
      studentAttendance.where((s) => s.status == 'present').length;
  int get absentCount =>
      studentAttendance.where((s) => s.status == 'absent').length;
  double get percentage =>
      totalStudents == 0 ? 0 : (presentCount / totalStudents) * 100;

  final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> markAttendance(int index, String status) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    // Find the student in the filtered list
    final student = studentAttendance[index];

    // Find the corresponding index in the _allStudentAttendance list
    final realIndex = _allStudentAttendance.indexWhere(
      (s) =>
          s.id == student.id &&
          s.date == student.date &&
          s.className == student.className,
    );

    if (realIndex != -1) {
      _allStudentAttendance[realIndex] = StudentAttendance(
        name: student.name,
        date: student.date,
        id: student.id,
        className: student.className,
        isMarked: true,
        status: status,
      );
    }

    _isLoading = false;
    notifyListeners();
  }

  // Future<void> markAttendance(int index, String status) async {
  //   log('${index}');
  //   log('${status}');
  //   log('${studentAttendance}');
  //   _isLoading = true;
  //   notifyListeners();

  //   await Future.delayed(Duration(seconds: 2));

  //   studentAttendance[index] = StudentAttendance(
  //     name: studentAttendance[index].name,
  //     date: today,
  //     id: studentAttendance[index].id,
  //     className: studentAttendance[index].className,
  //     isMarked: true,
  //     status: status,
  //   );

  //   _isLoading = false;
  //   notifyListeners();
  // }
}
