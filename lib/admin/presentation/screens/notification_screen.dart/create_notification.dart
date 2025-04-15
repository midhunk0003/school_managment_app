import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/calender_provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/notification_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class CreateNotification extends StatefulWidget {
  const CreateNotification({Key? key}) : super(key: key);

  @override
  _CreateNotificationState createState() => _CreateNotificationState();
}

class _CreateNotificationState extends State<CreateNotification> {
  final TextEditingController notificationTitleController =
      TextEditingController();
  final TextEditingController notificationmessageController =
      TextEditingController();

  String? selectAudience = "Both";

  final _formKey = GlobalKey<FormState>();

  Future<void> _refreshData() async {
    // Simulate a network call or any async operation to refresh data
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update your state here to refresh the UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Consumer<NotificationProvider>(
              builder: (context, notificationprovider, _) {
                return Stack(
                  children: [
                    Padding(
                      padding:
                          isTablet
                              ? const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 50,
                              )
                              : const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: RefreshIndicator(
                          onRefresh: _refreshData,
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(height: isTablet ? 40 : 20),
                                HeaderandBackwidget(
                                  text: 'Create Notifications',
                                ),
                                SizedBox(height: isTablet ? 80 : 40),

                                CreateEventFormWidget(
                                  controller: notificationTitleController,
                                  isTablet: isTablet,
                                  text1: 'Notification Title',
                                  hintText: 'Notification Title',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter Notification Title";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: isTablet ? 32 : 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          230,
                                          227,
                                          227,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                              value: "Both",
                                              groupValue: selectAudience,
                                              activeColor: Color(
                                                0xFFEE742A,
                                              ), // Change color
                                              onChanged: (value) {
                                                setState(() {
                                                  selectAudience =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                            Text("Both"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10), // Spacing
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          230,
                                          227,
                                          227,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                              value: "Teachers",
                                              groupValue: selectAudience,
                                              activeColor: Color(
                                                0xFFEE742A,
                                              ), // Change color
                                              onChanged: (value) {
                                                setState(() {
                                                  selectAudience =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                            Text("Teachers"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10), // Spacing
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          230,
                                          227,
                                          227,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                              value: "Parents",
                                              groupValue: selectAudience,
                                              activeColor: Color(
                                                0xFFEE742A,
                                              ), // Change color
                                              onChanged: (value) {
                                                setState(() {
                                                  selectAudience =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                            Text("Parents"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: isTablet ? 32 : 16),

                                CreateEventFormWidget(
                                  controller: notificationmessageController,
                                  isTablet: isTablet,
                                  text1: 'Notification Message',
                                  hintText: 'Notification Message',
                                  // isDate: true,
                                  maxLine: 5,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enterNotification Message";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: isTablet ? 32 : 16),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      print('validated');
                                      await notificationprovider
                                          .sendNotification();
                                    }
                                  },
                                  child: Container(
                                    height: isTablet ? 100 : 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: kButtonColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Send Notification',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // **Full-Screen Loader**
                    if (notificationprovider.isLoading)
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
      ),
    );
  }
}

class CreateEventFormWidget extends StatelessWidget {
  final String? text1;
  final String? hintText;
  final bool isDate;
  final int? maxLine;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final VoidCallback? onTap; // Added onTap parameter
  final bool readOnly;
  const CreateEventFormWidget({
    super.key,
    required this.isTablet,
    required this.text1,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.maxLine,
    this.isDate = false,
    this.onTap, // Initialize the onTap function
    this.readOnly = false, // Default is false
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('$text1', style: TextStyle(fontSize: isTablet ? 24 : 12)),
            SizedBox(width: 5),
            Text(
              '*',
              style: TextStyle(fontSize: isTablet ? 24 : 12, color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: '$hintText',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            filled: true,
            suffixIcon: isDate ? Icon(Icons.calendar_month) : null,
            contentPadding: EdgeInsets.symmetric(
              vertical: isTablet ? 20 : 12, // More padding for tablets
              horizontal: isTablet ? 24 : 16, // Adjust width padding
            ),
          ),
          maxLines: maxLine,
          readOnly: readOnly,
          validator: validator,
          onTap:
              onTap ??
              (isDate
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
                  : null),
        ),
      ],
    );
  }
}
