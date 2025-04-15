import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/enroll_student_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';
import 'package:schoolmanagment/widgets/successdilogebox.dart';

class EnrollNewStudentScreen extends StatefulWidget {
  const EnrollNewStudentScreen({Key? key}) : super(key: key);

  @override
  State<EnrollNewStudentScreen> createState() => _EnrollNewStudentScreenState();
}

class _EnrollNewStudentScreenState extends State<EnrollNewStudentScreen> {
  final TextEditingController childNameContoller = TextEditingController();
  final TextEditingController dateOfBirthContoller = TextEditingController();
  final TextEditingController addressContoller = TextEditingController();
  final TextEditingController parentNameContoller = TextEditingController();
  final TextEditingController ContactNumberContoller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? selectprogram;
  String? selectGender;

  Future<void> _refreshData() async {
    // Simulate a network call or any async operation to refresh data
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update your state here to refresh the UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          return Consumer<EnrollStudentProvider>(
            builder: (context, enrollstudent, _) {
              return Stack(
                children: [
                  Padding(
                    padding:
                        isTablet
                            ? const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 40,
                            )
                            : const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        HeaderandBackwidget(text: 'Enroll New Student'),
                        SizedBox(height: isTablet ? 60 : 30),
                        Text(
                          'Please fill in the required fields below',
                          style: GoogleFonts.josefinSans(
                            fontSize:
                                isTablet ? 40 : 18, // Larger text for tablet
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 30),
                        Form(
                          key: _formKey,
                          child: Expanded(
                            child: Container(
                              child: RefreshIndicator(
                                onRefresh: _refreshData,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      EnroolStdFormWidget(
                                        text1: 'Child Name',
                                        text2: '*',
                                        hintText: 'Child Name',
                                        controller: childNameContoller,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter child name';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      SizedBox(height: 20),
                                      EnroolStdFormWidget(
                                        text1: 'Date of Birth',
                                        text2: '*',
                                        hintText: 'MM/DD/YYYY',
                                        controller: dateOfBirthContoller,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter date of birth';
                                          } else {
                                            return null;
                                          }
                                        },
                                        // maxLine: 5,
                                        isDate: true,
                                      ),
                                      SizedBox(height: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Gender'),
                                              Text(
                                                '*',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              // labelText: "Sele",
                                              hintText: 'Select gender',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                borderSide: BorderSide.none,
                                              ),
                                              filled: true,
                                            ),
                                            value: selectprogram,
                                            items:
                                                ['Male', 'Female']
                                                    .map(
                                                      (gender) =>
                                                          DropdownMenuItem(
                                                            value: gender,
                                                            child: Text(gender),
                                                          ),
                                                    )
                                                    .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectprogram = value;
                                              });
                                            },
                                            validator:
                                                (value) =>
                                                    value == null
                                                        ? 'Please select gender'
                                                        : null,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      EnroolStdFormWidget(
                                        text1: 'Address',
                                        text2: '*',
                                        hintText: 'Enter full address',
                                        controller: addressContoller,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter address';
                                          } else {
                                            return null;
                                          }
                                        },
                                        maxLine: 5,
                                      ),
                                      SizedBox(height: 20),
                                      EnroolStdFormWidget(
                                        text1: 'Guardian/Parent Name',
                                        text2: '*',
                                        hintText:
                                            'Enter guardian or parent name',
                                        controller: parentNameContoller,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter guardian or parent name';
                                          } else {
                                            return null;
                                          }
                                        },
                                        // maxLine: 5,
                                      ),
                                      SizedBox(height: 20),
                                      EnroolStdFormWidget(
                                        text1: 'Contact Number',
                                        text2: '*',
                                        hintText: 'Enter contact number',
                                        controller: ContactNumberContoller,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter guardian or parent name';
                                          } else {
                                            return null;
                                          }
                                        },
                                        // maxLine: 5,
                                      ),
                                      SizedBox(height: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Select Program'),
                                              Text(
                                                '*',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              // labelText: "Sele",
                                              hintText: 'Select Program',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                borderSide: BorderSide.none,
                                              ),
                                              filled: true,
                                            ),
                                            value: selectprogram,
                                            items:
                                                ['Male', 'Female']
                                                    .map(
                                                      (gender) =>
                                                          DropdownMenuItem(
                                                            value: gender,
                                                            child: Text(gender),
                                                          ),
                                                    )
                                                    .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectprogram = value;
                                              });
                                            },
                                            validator:
                                                (value) =>
                                                    value == null
                                                        ? 'Please select program'
                                                        : null,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      InkWell(
                                        onTap: () async {
                                          // if (_formKey.currentState!.validate()) {}
                                          await enrollstudent
                                              .newEnrollStudentSubmitFunction();
                                          successDialogBox(
                                            context,
                                            'Enrollment Submitted Successfully',
                                            '',
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: kButtonColor,
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Submit Enrollment',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // **Full-Screen Loader**
                  if (enrollstudent.isFormSubmitLoading)
                    Container(
                      color: Colors.black.withOpacity(
                        0.3,
                      ), // Semi-transparent background
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class EnroolStdFormWidget extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? hintText;
  final int? maxLine;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isDate;
  const EnroolStdFormWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.maxLine,
    this.isDate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('$text1'),
            Text('$text2', style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: 12),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: '$hintText',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            filled: true,
            suffixIcon: isDate ? Icon(Icons.calendar_month) : null,
          ),
          maxLines: maxLine,

          onTap:
              isDate
                  ? () async {
                    FocusScope.of(
                      context,
                    ).requestFocus(FocusNode()); // remove focus
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
                  : null,
        ),
      ],
    );
  }
}
