import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/attendance_history.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/class_shadule_screen.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class ChildProfileScreen extends StatefulWidget {
  const ChildProfileScreen({Key? key}) : super(key: key);

  @override
  _ChildProfileScreenState createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isTablet ? 40 : 20),
                  HeaderandBackwidget(text: 'Child Profile'),
                  SizedBox(height: isTablet ? 80 : 40),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding:
                          isTablet
                              ? const EdgeInsets.all(40)
                              : const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: isTablet ? 100 : 50,
                                height: isTablet ? 100 : 50,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              SizedBox(width: isTablet ? 20 : 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Elina',
                                    style: TextStyle(
                                      color: kPrimaryTextColor,
                                      fontSize: isTablet ? 40 : 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'ID Number : 1023',
                                    style: TextStyle(
                                      color: kSecondaryTextColor,
                                      fontSize: isTablet ? 24 : 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: isTablet ? 40 : 20),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Grade',
                                      style: TextStyle(
                                        color: kSecondaryTextColor,
                                        fontSize: isTablet ? 24 : 12,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Grade 5 – Section A',
                                      style: TextStyle(
                                        color: kPrimaryTextColor,
                                        fontSize: isTablet ? 32 : 16,
                                        fontWeight: FontWeight.bold,
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
                                      'Enrollment Date',
                                      style: TextStyle(
                                        color: kSecondaryTextColor,
                                        fontSize: isTablet ? 24 : 12,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '04/15/2025',
                                      style: TextStyle(
                                        color: kPrimaryTextColor,
                                        fontSize: isTablet ? 32 : 16,
                                        fontWeight: FontWeight.bold,
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
                  ),

                  SizedBox(height: isTablet ? 40 : 20),
                  Container(
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.orange,
                      indicatorWeight: 4.0,
                      indicatorSize:
                          TabBarIndicatorSize
                              .tab, // Indicator width matches label
                      labelColor: kPrimaryTextColor,

                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(
                        fontSize: isTablet ? 32 : 16,
                        fontWeight: FontWeight.bold,
                      ), // Selected tab
                      unselectedLabelStyle: TextStyle(
                        fontSize: isTablet ? 28 : 14,
                      ), // Unselected tab
                      tabs: [
                        Tab(text: "Class Schedule"),
                        Tab(text: "Attendance History"),
                      ],
                    ),
                  ),
                  SizedBox(height: isTablet ? 40 : 20),
                  // TabBarView should be wrapped inside Expanded to prevent overflow
                  // Text(
                  //   'class schedule',
                  //   style: GoogleFonts.josefinSans(
                  //     fontSize: isTablet ? 40 : 20, // Larger text for tablet
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [ClassShaduleScreen(), AttendanceHistory()],
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
