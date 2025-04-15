import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class StudentIdDetailsScreen extends StatefulWidget {
  const StudentIdDetailsScreen({Key? key}) : super(key: key);

  @override
  _StudentIdDetailsScreenState createState() => _StudentIdDetailsScreenState();
}

class _StudentIdDetailsScreenState extends State<StudentIdDetailsScreen> {
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
              child: Column(
                children: [
                  SizedBox(height: isTablet ? 40 : 20),
                  HeaderandBackwidget(text: 'Student ID Details'),
                  SizedBox(height: isTablet ? 80 : 40),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding:
                          isTablet
                              ? const EdgeInsets.all(50)
                              : const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: isTablet ? 200 : 100,
                                    width: isTablet ? 200 : 100,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  SizedBox(width: isTablet ? 20 : 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Child name',
                                        style: TextStyle(
                                          fontSize: isTablet ? 24 : 12,
                                        ),
                                      ),
                                      Text(
                                        'Aisha Khan',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                        ),
                                      ),
                                      SizedBox(height: isTablet ? 40 : 15),
                                      Text(
                                        'ID Number',
                                        style: TextStyle(
                                          fontSize: isTablet ? 24 : 12,
                                        ),
                                      ),
                                      Text(
                                        '1023',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Container(
                                height: isTablet ? 60 : 30,
                                width: isTablet ? 60 : 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/Frame.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextDetailsWidgets(
                            lefttext1: "Date of Birth",
                            lefttext2: "05/14/2012",
                            righttext1: "Gender",
                            righttext2: "Female",
                            isTablet: isTablet,
                          ),
                          SizedBox(height: 20),
                          // second section
                          Container(
                            height: isTablet ? 50 : 25,
                            width: double.infinity,
                            decoration: BoxDecoration(color: Color(0xFFEE742A)),
                            child: Padding(
                              padding:
                                  isTablet
                                      ? const EdgeInsets.only(left: 20, top: 6)
                                      : const EdgeInsets.only(left: 10, top: 3),
                              child: Text(
                                'Class & Enrollment Details',
                                style: GoogleFonts.josefinSans(
                                  fontSize:
                                      isTablet
                                          ? 28
                                          : 14, // Larger text for tablet
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextDetailsWidgets(
                            lefttext1: "Class",
                            lefttext2: "Class: 3A",
                            righttext1: "Enrollment Date",
                            righttext2: "04/15/2025",
                            isTablet: isTablet,
                          ),
                          SizedBox(height: 20),
                          // third section
                          Container(
                            height: isTablet ? 50 : 25,
                            width: double.infinity,
                            decoration: BoxDecoration(color: Color(0xFFEE742A)),
                            child: Padding(
                              padding:
                                  isTablet
                                      ? const EdgeInsets.only(left: 20, top: 6)
                                      : const EdgeInsets.only(left: 10, top: 3),
                              child: Text(
                                'Additional Information',
                                style: GoogleFonts.josefinSans(
                                  fontSize:
                                      isTablet
                                          ? 28
                                          : 14, // Larger text for tablet
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextDetailsWidgets(
                            lefttext1: "Parent Name:",
                            lefttext2: "Fatima Khan",
                            righttext1: "Contact Number",
                            righttext2: "9876543210",
                            isTablet: isTablet,
                          ),
                          Divider(),
                          TextDetailsWidgets(
                            lefttext1: "Program",
                            lefttext2: "Grade 3 – Section A",
                            isTablet: isTablet,
                          ),
                          Divider(),

                          TextDetailsWidgets(
                            lefttext1: "Address",
                            lefttext2: "8 Pine Lane, Suburban Heights,TX 75001",
                            isTablet: isTablet,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TextDetailsWidgets extends StatelessWidget {
  final String? lefttext1;
  final String? lefttext2;
  final String? righttext1;
  final String? righttext2;
  final bool isTablet;

  const TextDetailsWidgets({
    super.key,
    required this.lefttext1,
    required this.lefttext2,
    this.righttext1,
    this.righttext2,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lefttext1 ?? '',
                style: TextStyle(
                  color: Color(0xFF606060),
                  fontSize: isTablet ? 25 : 12,
                ),
              ),
              Text(
                lefttext2 ?? '',
                style: TextStyle(
                  color: Color(0xFF171717),
                  fontSize: isTablet ? 32 : 16,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                righttext1 ?? '',
                style: TextStyle(
                  color: Color(0xFF606060),
                  fontSize: isTablet ? 25 : 12,
                ),
              ),
              Text(
                righttext2 ?? '',
                style: TextStyle(
                  color: Color(0xFF171717),
                  fontSize: isTablet ? 32 : 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
