import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/student_manage_id_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class ManageStudentIdScreen extends StatefulWidget {
  const ManageStudentIdScreen({Key? key}) : super(key: key);

  @override
  _ManageStudentIdScreenState createState() => _ManageStudentIdScreenState();
}

class _ManageStudentIdScreenState extends State<ManageStudentIdScreen> {
  int selectIndex = 0;
  final List<String> classes = ["Class 1", "Class 2", "Class 3", "Class 4"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<StudentManageIdProvider>(
          builder: (context, studentIdmanageprovider, _) {
            return LayoutBuilder(
              builder: (context, constraints) {
                bool isTablet = constraints.maxWidth > 600;
                return Stack(
                  children: [
                    Padding(
                      padding:
                          isTablet
                              ? const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 40,
                              )
                              : const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          HeaderandBackwidget(text: 'Manage Student ID’s'),
                          SizedBox(height: isTablet ? 80 : 40),
                          SizedBox(
                            height: isTablet ? 120 : 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: classes.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    await studentIdmanageprovider.selectClass(
                                      index,
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isTablet ? 60 : 30,
                                      vertical: isTablet ? 20 : 10,
                                    ),
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                          studentIdmanageprovider
                                                      .selectedIndex ==
                                                  index
                                              ? const Color(0xFFEE742A)
                                              : const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ), // Unselected color,
                                      borderRadius:
                                          isTablet
                                              ? BorderRadius.circular(50)
                                              : BorderRadius.circular(25),
                                      border: Border.all(
                                        color: const Color(0xFFEE742A),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        classes[index],
                                        style:
                                            studentIdmanageprovider
                                                        .selectedIndex ==
                                                    index
                                                ? TextStyle(
                                                  color: Colors.white,
                                                  fontSize: isTablet ? 24 : 12,
                                                )
                                                : TextStyle(
                                                  fontSize: isTablet ? 24 : 12,
                                                  color: const Color(
                                                    0xFFEE742A,
                                                  ),
                                                ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: isTablet ? 60 : 30),
                          // Dynamic Content Based on Selection
                          const SizedBox(height: 30),
                          Expanded(
                            child: Consumer<StudentManageIdProvider>(
                              builder: (context, provider, child) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/studentiddetailsscreen',
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding:
                                        isTablet
                                            ? const EdgeInsets.all(25)
                                            : const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      // color: Colors.amber[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child:
                                        provider.isLoading
                                            ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                            : provider.selectedStudents.isEmpty
                                            ? Center(
                                              child: Text(
                                                "No students in this class",
                                                style: TextStyle(
                                                  fontSize: isTablet ? 36 : 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                            : ListView.separated(
                                              itemCount:
                                                  provider
                                                      .selectedStudents
                                                      .length,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  height: isTablet ? 40 : 20,
                                                );
                                              },
                                              itemBuilder: (context, index) {
                                                final student =
                                                    provider
                                                        .selectedStudents[index];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          16,
                                                        ),
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        isTablet
                                                            ? const EdgeInsets.all(
                                                              50,
                                                            )
                                                            : const EdgeInsets.all(
                                                              20,
                                                            ),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Flexible(
                                                              flex: 3,
                                                              child: Container(
                                                                height:
                                                                    isTablet
                                                                        ? 100
                                                                        : 50,
                                                                width:
                                                                    isTablet
                                                                        ? 100
                                                                        : 50,
                                                                decoration: BoxDecoration(
                                                                  color:
                                                                      Colors
                                                                          .amber,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        8,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  isTablet
                                                                      ? 20
                                                                      : 10,
                                                            ),
                                                            Flexible(
                                                              flex: 5,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Aisha Khan',
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          isTablet
                                                                              ? 32
                                                                              : 16,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'ID Number : 1023',
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          isTablet
                                                                              ? 32
                                                                              : 16,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              isTablet
                                                                  ? 40
                                                                  : 20,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Class',
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          isTablet
                                                                              ? 30
                                                                              : 12,
                                                                      color: Color(
                                                                        0xFF606060,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    ' 3 - Section B',
                                                                    style: TextStyle(
                                                                      color: Color(
                                                                        0xFF171717,
                                                                      ),
                                                                      fontSize:
                                                                          isTablet
                                                                              ? 36
                                                                              : 16,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Enrollment Date',
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          isTablet
                                                                              ? 30
                                                                              : 12,
                                                                      color: Color(
                                                                        0xFF606060,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '04/15/2025',
                                                                    style: TextStyle(
                                                                      color: Color(
                                                                        0xFF171717,
                                                                      ),
                                                                      fontSize:
                                                                          isTablet
                                                                              ? 36
                                                                              : 16,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        floatingActionButton: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600; // tablet breakpoint

            return SizedBox(
              width: isTablet ? 300 : 170, // wider on tablet
              height: isTablet ? 100 : 50, // taller on tablet
              child: FloatingActionButton.extended(
                onPressed: () {
                  // action when clicked
                  Navigator.pushNamed(context, '/createstudentidscreen');
                },
                backgroundColor: kButtonColor,
                icon: Icon(
                  Icons.add,
                  size: isTablet ? 50 : 24, // larger icon for tablet
                  color: kButtonTextColor,
                ),
                label: Text(
                  'Create New ID',
                  style: TextStyle(
                    color: kButtonTextColor,
                    fontSize: isTablet ? 30 : 16, // larger text for tablet
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
