import 'package:flutter/material.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class PAssignmentScreen extends StatefulWidget {
  const PAssignmentScreen({Key? key}) : super(key: key);

  @override
  _PAssignmentScreenState createState() => _PAssignmentScreenState();
}

class _PAssignmentScreenState extends State<PAssignmentScreen> {
  List<Color> containerColors = [
    Color(0xFFEEEFF7),
    Color(0xFFF1FDE7),
    Color(0xFFFCE8E9),
    Color(0xFFFCF9B6),
  ];
  List<Color> containersmallColors = [
    Color(0xFF4A599B),
    Color(0xFF4EA70B),
    Color(0xFFCB1A20),
    Color(0xFFF6EE23),
  ];

  Future<void> _refreshData() async {
    // Simulate a network call or any async operation to refresh data
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update your state here to refresh the UI
      print('refresh');
    });
  }

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
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: isTablet ? 40 : 20),
                      HeaderandBackwidget(text: 'Assignment'),
                      SizedBox(height: isTablet ? 60 : 30),
                      Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.grey),
                                  color:
                                      containerColors[index %
                                          containerColors.length],
                                ),
                                child: Padding(
                                  padding:
                                      isTablet
                                          ? const EdgeInsets.all(40)
                                          : const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: isTablet ? 80 : 40,
                                                width: isTablet ? 80 : 40,
                                                decoration: BoxDecoration(
                                                  color:
                                                      containersmallColors[index %
                                                          containersmallColors
                                                              .length],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/teacher/assignmentpage/assignmentteachericon.png',
                                                ),
                                              ),

                                              SizedBox(
                                                width: isTablet ? 20 : 10,
                                              ),
                                              Text(
                                                'History Homework: Chapter 12',
                                                style: TextStyle(
                                                  fontSize: isTablet ? 32 : 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),

                                          // Container(
                                          //   width: isTablet ? 80 : 40,
                                          //   height: isTablet ? 80 : 40,
                                          //   decoration: BoxDecoration(
                                          //     shape: BoxShape.circle,
                                          //     border: Border.all(
                                          //       color: Colors.black, // Border color
                                          //       width: 2, // Border width
                                          //     ),
                                          //   ),
                                          //   child: const Center(
                                          //     child: Icon(
                                          //       Icons.edit, // Center icon
                                          //       color: Colors.black,
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      SizedBox(height: isTablet ? 24 : 12),
                                      Text(
                                        'To effectively complete problems 1-10 focusing on fractions and mixed numbers, carefully review the example problems on page 56 of your textbook. ',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                        ),
                                      ),
                                      SizedBox(height: isTablet ? 24 : 12),
                                      Text(
                                        'Due : April 10, 2025',
                                        style: TextStyle(
                                          color: Color(0xFF484848),
                                          fontSize: isTablet ? 28 : 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: isTablet ? 20 : 10);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
