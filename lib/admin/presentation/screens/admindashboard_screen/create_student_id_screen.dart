import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/student_manage_id_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class CreateStudentIdScreen extends StatefulWidget {
  const CreateStudentIdScreen({Key? key}) : super(key: key);

  @override
  _CreateStudentIdScreenState createState() => _CreateStudentIdScreenState();
}

class _CreateStudentIdScreenState extends State<CreateStudentIdScreen> {
  final TextEditingController childNameController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController gardianOrParentsController =
      TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController enrollmentDateController =
      TextEditingController();

  String? selectGender;
  String? selectProgram;

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
                      ? const EdgeInsets.symmetric(horizontal: 40, vertical: 40)
                      : const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<StudentManageIdProvider>(
                builder: (context, createStudidprovider, _) {
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: isTablet ? 40 : 20),
                              HeaderandBackwidget(text: 'Create New IDs'),
                              SizedBox(height: isTablet ? 80 : 40),
                              CreateNewIdFormWidget(
                                isTablet: isTablet,
                                text1: 'Child’s Name',
                                text2: '*',
                                hintText: 'Enter Child’s Name',
                                controller: childNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Child’s Name';
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
                                        'Child Image Upload',
                                        style: TextStyle(
                                          fontSize: isTablet ? 24 : 12,
                                        ),
                                      ),
                                      Text(
                                        '*',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: isTablet ? 24 : 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: isTablet ? 24 : 12),
                                  SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              createStudidprovider.pickImage();
                                            },
                                            child: DottedBorder(
                                              radius: Radius.circular(20),
                                              strokeWidth: 1,
                                              child: Container(
                                                height: isTablet ? 360 : 180,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  // borderRadius: BorderRadius.circular(16),
                                                  // border: Border.all(),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    20,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height:
                                                            isTablet ? 80 : 40,
                                                        width:
                                                            isTablet ? 80 : 40,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: AssetImage(
                                                              'assets/images/childimageupload.png',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      // SizedBox(height: isTablet ? 12 : 12),
                                                      Text(
                                                        'Upload Child Image',
                                                        style: TextStyle(
                                                          fontSize:
                                                              isTablet
                                                                  ? 32
                                                                  : 16,
                                                          color:
                                                              kPrimaryTextColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            isTablet ? 10 : 5,
                                                      ),
                                                      Text(
                                                        'Click browse to upload (max 4mb)',
                                                        style: TextStyle(
                                                          fontSize:
                                                              isTablet
                                                                  ? 24
                                                                  : 12,
                                                          color:
                                                              kSecondaryTextColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            isTablet ? 32 : 16,
                                                      ),

                                                      Container(
                                                        height:
                                                            isTablet ? 60 : 30,
                                                        width:
                                                            isTablet
                                                                ? 200
                                                                : 100,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                25,
                                                              ),
                                                          border: Border.all(),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'Select file',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          createStudidprovider.selectImage !=
                                                  null
                                              ? Stack(
                                                children: [
                                                  Container(
                                                    // height: isTablet ? 120 : 60,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                            255,
                                                            216,
                                                            214,
                                                            214,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            16,
                                                          ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          isTablet
                                                              ? const EdgeInsets.all(
                                                                20,
                                                              )
                                                              : const EdgeInsets.all(
                                                                10,
                                                              ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width:
                                                                    isTablet
                                                                        ? 80
                                                                        : 40,
                                                                height:
                                                                    isTablet
                                                                        ? 80
                                                                        : 40,
                                                                decoration: BoxDecoration(
                                                                  color:
                                                                      Colors
                                                                          .amber,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                  image: DecorationImage(
                                                                    image: FileImage(
                                                                      createStudidprovider
                                                                          .selectImage!,
                                                                    ),
                                                                    fit:
                                                                        BoxFit
                                                                            .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    isTablet
                                                                        ? 20
                                                                        : 10,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Profile image.img',
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          isTablet
                                                                              ? 24
                                                                              : 12,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            isTablet
                                                                                ? 12
                                                                                : 6,
                                                                        width:
                                                                            isTablet
                                                                                ? 800
                                                                                : 230,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            20,
                                                                          ),
                                                                          color:
                                                                              Colors.orange,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        '${(createStudidprovider.uploadProgress * 100).toInt()}%',
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  // Positioned delete button on the right
                                                  Positioned(
                                                    right: isTablet ? 40 : 10,
                                                    top: isTablet ? 20 : 10,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // Add delete functionality here
                                                        createStudidprovider
                                                            .clearImage();
                                                      },
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                        size:
                                                            isTablet ? 24 : 18,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                              : SizedBox.shrink(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: isTablet ? 40 : 20),
                              CreateNewIdFormWidget(
                                isTablet: isTablet,
                                text1: 'Student ID',
                                text2: '*',
                                hintText: 'Enter Student ID',
                                controller: studentIdController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Enter Student ID';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              CreateNewIdFormWidget(
                                isTablet: isTablet,
                                text1: 'Date of Birth',
                                text2: '*',
                                hintText: 'MM/DD/YYYY',
                                isDate: true,
                                controller: dateOfBirthController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Date of Birth';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              CreateNewIdFormWidget(
                                isTablet: isTablet,
                                text1: 'Address',
                                text2: '*',
                                hintText: 'Enter Address',
                                controller: addressController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Address ';
                                  } else {
                                    return null;
                                  }
                                },
                                maxLine: 5,
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Gender'),
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      // labelText: "Sele",
                                      hintText: 'Select Gender',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                    ),
                                    value: selectGender,
                                    items:
                                        ['Male', 'Female']
                                            .map(
                                              (gender) => DropdownMenuItem(
                                                value: gender,
                                                child: Text(gender),
                                              ),
                                            )
                                            .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectGender = value;
                                      });
                                    },
                                    validator:
                                        (value) =>
                                            value == null
                                                ? 'Please select Gender'
                                                : null,
                                  ),
                                ],
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              CreateNewIdFormWidget(
                                isTablet: isTablet,
                                text1: 'Guardian/Parent Name',
                                text2: '*',
                                hintText: 'Enter Guardian/Parent Name',
                                controller: gardianOrParentsController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Guardian/Parent Name';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              CreateNewIdFormWidget(
                                isTablet: isTablet,
                                text1: 'Contact Number',
                                text2: '*',
                                hintText: 'Enter Contact Number',
                                controller: contactNumberController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Contact Number';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Select Program'),
                                      Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      // labelText: "Sele",
                                      hintText: 'Select Program',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                    ),
                                    value: selectGender,
                                    items:
                                        ['Male', 'Female']
                                            .map(
                                              (gender) => DropdownMenuItem(
                                                value: gender,
                                                child: Text(gender),
                                              ),
                                            )
                                            .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectGender = value;
                                      });
                                    },
                                    validator:
                                        (value) =>
                                            value == null
                                                ? 'Please select Gender'
                                                : null,
                                  ),
                                ],
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              CreateNewIdFormWidget(
                                isTablet: isTablet,
                                text1: 'Enrollment Date',
                                text2: '*',
                                hintText: 'Enter Enrollment Date',
                                controller: enrollmentDateController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Enrollment Date';
                                  } else {
                                    return null;
                                  }
                                },
                                isDate: true,
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              // button
                              InkWell(
                                onTap: () async {
                                  // if (_formKey.currentState!.validate()) {}
                                  await createStudidprovider.createStudentId();
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      // Auto close after 1 second
                                      Future.delayed(Duration(seconds: 2), () {
                                        Navigator.of(context).pop();
                                      });
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          height: 300,
                                          width: 300,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Lottie.asset(
                                                'assets/json/successanimation.json', // Your lottie file path
                                                height: 150,
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                'Enrollment Submitted Successfully',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: kButtonColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Create ID',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class CreateNewIdFormWidget extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? hintText;
  final int? maxLine;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isDate;
  const CreateNewIdFormWidget({
    super.key,
    required this.isTablet,
    required this.text1,
    required this.text2,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.maxLine,
    this.isDate = false,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('$text1', style: TextStyle(fontSize: isTablet ? 24 : 12)),
            Text(
              '$text2',
              style: TextStyle(color: Colors.red, fontSize: isTablet ? 24 : 12),
            ),
          ],
        ),
        SizedBox(height: isTablet ? 24 : 12),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            filled: true,
            suffixIcon: isDate ? Icon(Icons.calendar_month) : null,
            contentPadding: EdgeInsets.symmetric(
              vertical: isTablet ? 30 : 12, // Button height
              horizontal: isTablet ? 40 : 24,
            ),
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
