import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class FieldTripFormCreate extends StatefulWidget {
  const FieldTripFormCreate({Key? key}) : super(key: key);

  @override
  _FieldTripFormCreateState createState() => _FieldTripFormCreateState();
}

class _FieldTripFormCreateState extends State<FieldTripFormCreate> {
  final TextEditingController tripTitleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController eventDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? _imagePath; // Change to String? for holding the image path

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Pick from Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Take a Photo'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
    );
  }

  Future<void> _refreshData() async {
    // Simulate a network call or any async operation to refresh data
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update your state here to refresh the UI
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;

            return Padding(
              padding:
                  isTablet
                      ? const EdgeInsets.symmetric(horizontal: 50, vertical: 50)
                      : const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: isTablet ? 40 : 20),
                    HeaderandBackwidget(text: 'Create New Field Trip'),
                    SizedBox(height: isTablet ? 80 : 40),
                    Expanded(
                      child: Container(
                        child: RefreshIndicator(
                          onRefresh: _refreshData,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CreateNewFieldTrip(
                                  isTablet: isTablet,
                                  text1: 'Trip Title',
                                  hintText: 'Enter Trip Title',
                                  controller: tripTitleController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter trip title";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: isTablet ? 40 : 20),
                                CreateNewFieldTrip(
                                  isTablet: isTablet,
                                  text1: 'Location',
                                  hintText: 'select Location',
                                  controller: locationController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter or select Location";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: isTablet ? 40 : 20),
                                CreateNewFieldTrip(
                                  isTablet: isTablet,
                                  text1: 'Event Date',
                                  hintText: 'DD/MM/YYYY',
                                  controller: eventDateController,
                                  isDate: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter Event Date";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: isTablet ? 40 : 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CreateNewFieldTrip(
                                        isTablet: isTablet,
                                        text1: 'Start Time',
                                        hintText: 'Start Time',
                                        controller: startTimeController,
                                        // isDate: true,
                                        isTime: true,
                                        // maxLine: 5,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "please select Start Time";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: CreateNewFieldTrip(
                                        isTablet: isTablet,
                                        text1: 'End Time',
                                        hintText: 'End Time',
                                        controller: endTimeController,
                                        // isDate: true,
                                        isTime: true,
                                        // maxLine: 5,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "please select End Time";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: isTablet ? 40 : 20),
                                CreateNewFieldTrip(
                                  isTablet: isTablet,
                                  text1: 'Description',
                                  hintText: 'Enter Description',
                                  controller: descriptionController,
                                  // isDate: true,
                                  maxLine: 5,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter Description";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: isTablet ? 40 : 20),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Upload Trip Cover Image',
                                          style: TextStyle(
                                            fontSize: isTablet ? 30 : 15,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '*',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: isTablet ? 20 : 10),
                                    GestureDetector(
                                      onTap: () {
                                        _showPickerOptions();
                                      },
                                      child: Container(
                                        height: isTablet ? 300 : 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          border: Border.all(),
                                        ),
                                        child:
                                            _imagePath != null
                                                ? Image.file(
                                                  File(_imagePath!),
                                                  fit: BoxFit.cover,
                                                )
                                                : Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      child: Image.asset(
                                                        'assets/images/teacher/gallery/photo.png',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          isTablet ? 20 : 10,
                                                    ),
                                                    Text(
                                                      'Tap to upload photos',
                                                      style: TextStyle(
                                                        fontSize:
                                                            isTablet ? 24 : 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: isTablet ? 80 : 40),
                                InkWell(
                                  onTap: () {
                                    if (_imagePath == null ||
                                        _imagePath!.isEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Please select an image!',
                                          ),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsets.only(
                                            bottom: 10.0, // Space from bottom
                                            left: 16.0,
                                            right: 16.0,
                                          ),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                    if (_formKey.currentState!.validate()) {
                                      print('validated');
                                    }
                                  },
                                  child: Container(
                                    height: isTablet ? 100 : 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Save Trip',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: isTablet ? 32 : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: isTablet ? 80 : 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CreateNewFieldTrip extends StatelessWidget {
  final String? text1;
  final String? hintText;
  final bool isDate;
  final bool isTime;
  final int? maxLine;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CreateNewFieldTrip({
    super.key,
    required this.isTablet,
    required this.text1,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.isDate = false,
    this.isTime = false,
    this.maxLine,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('$text1', style: TextStyle(fontSize: isTablet ? 30 : 15)),
            SizedBox(width: 5),
            Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: isTablet ? 20 : 10),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: '$hintText',
            suffixIcon:
                isTime
                    ? Icon(Icons.timelapse)
                    : isDate
                    ? Icon(Icons.date_range)
                    : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            filled: true,
          ),
          onTap: () async {
            if (isTime) {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                controller.text = pickedTime.format(context);
              }
            }
            if (isDate) {
              FocusScope.of(context).requestFocus(FocusNode()); // remove focus
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                controller.text =
                    "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
              }
            }
            null;
          },
          maxLines: maxLine,
        ),
      ],
    );
  }
}
