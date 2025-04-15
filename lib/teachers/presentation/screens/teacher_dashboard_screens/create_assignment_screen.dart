import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class CreateAssignmentScreen extends StatefulWidget {
  const CreateAssignmentScreen({Key? key}) : super(key: key);

  @override
  _CreateAssignmentScreenState createState() => _CreateAssignmentScreenState();
}

class _CreateAssignmentScreenState extends State<CreateAssignmentScreen> {
  final TextEditingController assignmentTitleController =
      TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController assignmentDescriptionController =
      TextEditingController();

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: isTablet ? 40 : 20),
                    HeaderandBackwidget(text: 'Create Assignment'),
                    SizedBox(height: isTablet ? 80 : 40),

                    CreateAssignmentFormWidget(
                      isTablet: isTablet,
                      controller: assignmentTitleController,
                      text: 'Assignment Title',
                      hintText: 'Assignment Title',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter assignment title';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: isTablet ? 30 : 15),
                    CreateAssignmentFormWidget(
                      isTablet: isTablet,
                      controller: dueDateController,
                      text: 'Due Date',
                      hintText: 'Due Date',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter Due Date';
                        } else {
                          return null;
                        }
                      },
                      isDate: true,
                    ),
                    SizedBox(height: isTablet ? 30 : 15),
                    CreateAssignmentFormWidget(
                      isTablet: isTablet,
                      controller: assignmentDescriptionController,
                      text: 'Assignment Description',
                      hintText: 'Assignment Description',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter Assignment Description';
                        } else {
                          return null;
                        }
                      },
                      maxLine: 5,
                    ),
                    SizedBox(height: isTablet ? 60 : 30),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print('validated');
                        }
                      },
                      child: Container(
                        height: isTablet ? 100 : 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            'Publish Assignment',
                            style: TextStyle(color: Colors.white),
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

class CreateAssignmentFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? text;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool isDate;
  final int? maxLine;
  const CreateAssignmentFormWidget({
    super.key,
    required this.controller,
    required this.isTablet,
    required this.text,
    required this.hintText,
    required this.validator,
    this.isDate = false,
    this.maxLine,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('$text', style: TextStyle(fontSize: isTablet ? 24 : 12)),
          ],
        ),
        SizedBox(height: isTablet ? 24 : 12),
        TextFormField(
          controller: controller,
          validator: validator,

          decoration: InputDecoration(
            suffixIcon: isDate ? Icon(Icons.date_range_outlined) : null,
            hintText: '$hintText',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            filled: true,
          ),
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
          maxLines: maxLine,
        ),
      ],
    );
  }
}
