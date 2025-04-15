import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schoolmanagment/admin/data/model/studentid_models.dart';

class StudentManageIdProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  int _selectedIndex = 0;
  final List<String?> _classes = ["Class 1", "Class 2", "Class 3", "Class 4"];
  final Map<String, List<Student>> _students = {
    "Class 1": [
      Student(
        name: "Alice",
        idNumber: "S001",
        studentClass: "Class 1",
        enrollDate: "2022-01-10",
      ),
      Student(
        name: "Bob",
        idNumber: "S002",
        studentClass: "Class 1",
        enrollDate: "2022-02-15",
      ),
    ],
    "Class 2": [
      Student(
        name: "Charlie",
        idNumber: "S003",
        studentClass: "Class 2",
        enrollDate: "2022-03-20",
      ),
    ],
    "Class 3": [
      Student(
        name: "David",
        idNumber: "S004",
        studentClass: "Class 3",
        enrollDate: "2022-04-05",
      ),
    ],
    "Class 4": [],
  };

  File? _selectImage;
  double _uploadProgress = 0.0;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int get selectedIndex => _selectedIndex;
  List<String?> get classes => _classes;
  List<Student> get selectedStudents =>
      _students[_classes[_selectedIndex]] ?? [];
  File? get selectImage => _selectImage;
  double get uploadProgress => _uploadProgress;

  final ImagePicker _picker = ImagePicker();
  Future<void> selectClass(int index) async {
    _isLoading = true;
    notifyListeners();
    _selectedIndex = index;
    await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }

  Future<void> createStudentId() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      int fileSize = await file.length();

      // check if file size extend 4mb
      if (fileSize > 4 * 1024 * 1024) {
        _errorMessage = "File Size must be less than 4Mb";
        notifyListeners();
        return;
      }

      _selectImage = file;
      _errorMessage = null;
      notifyListeners();

      uploadImage();
    }
  }

  void uploadImage() async {
    _uploadProgress = 0.0;
    notifyListeners();

    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(milliseconds: 300)); // Simulate upload
      _uploadProgress = i / 10;
      notifyListeners();
    }
  }

  void clearImage() {
    _selectImage = null;
    _uploadProgress = 0.0;
    _errorMessage = null;
    notifyListeners();
  }
}
