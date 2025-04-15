import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/report_over_view_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class ReportOverViewScreen extends StatefulWidget {
  const ReportOverViewScreen({Key? key}) : super(key: key);

  @override
  _ReportOverViewScreenState createState() => _ReportOverViewScreenState();
}

class _ReportOverViewScreenState extends State<ReportOverViewScreen> {
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
              child: Consumer<ReportOverViewProvider>(
                builder: (context, reportviewprovider, _) {
                  return Column(
                    children: [
                      SizedBox(height: isTablet ? 40 : 20),
                      HeaderandBackwidget(text: 'Reports overview'),
                      SizedBox(height: isTablet ? 40 : 20),

                      // first container
                      Container(
                        decoration: BoxDecoration(
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
                              // first row
                              Row(
                                children: [
                                  Container(
                                    width: isTablet ? 50 : 50,
                                    height: isTablet ? 50 : 50,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                          'assets/images/newadmissionimages/newadmission1.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: isTablet ? 24 : 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'New Admissions',
                                        style: GoogleFonts.josefinSans(
                                          fontSize: isTablet ? 32 : 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text(
                                        'Overview of recent student joins',
                                        style: GoogleFonts.josefinSans(
                                          fontSize: isTablet ? 24 : 12,
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              // second row report graph
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 100,
                                      child: PieChart(
                                        PieChartData(
                                          sections: [
                                            PieChartSectionData(
                                              value:
                                                  reportviewprovider.newStudents
                                                      .toDouble(),
                                              color: Colors.grey,
                                              radius: 25,
                                            ),
                                            PieChartSectionData(
                                              value:
                                                  reportviewprovider.oldStudents
                                                      .toDouble(),
                                              color: Colors.orange,
                                              radius: 40,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                  255,
                                                  212,
                                                  211,
                                                  211,
                                                ),
                                            radius: 8,
                                          ),
                                          SizedBox(height: 10),
                                          CircleAvatar(
                                            backgroundColor: Colors.orange,
                                            radius: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('20% of the new students'),
                                          SizedBox(height: 10),
                                          Text('80% of the old students'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // third section
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildStatColumn(
                                    "Total Students",
                                    reportviewprovider.totalStudents,
                                  ),
                                  Container(
                                    width: 2,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  _buildStatColumn(
                                    "New Students",
                                    reportviewprovider.newStudents,
                                  ),
                                  Container(
                                    width: 2,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  _buildStatColumn(
                                    "Old Students",
                                    reportviewprovider.oldStudents,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // second container
                      Container(
                        decoration: BoxDecoration(
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
                              // first row
                              Row(
                                children: [
                                  Container(
                                    width: isTablet ? 50 : 50,
                                    height: isTablet ? 50 : 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4A599B),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                          'assets/images/newadmissionimages/newadmission2.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: isTablet ? 24 : 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Fee Collection',
                                        style: GoogleFonts.josefinSans(
                                          fontSize: isTablet ? 32 : 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text(
                                        '${(reportviewprovider.progress * 100).toInt()}% of fees collected this month',
                                        style: GoogleFonts.josefinSans(
                                          fontSize: isTablet ? 24 : 12,
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              // second row report graph
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: isTablet ? 500 : 250,
                                      height: isTablet ? 16 : 8,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          194,
                                          191,
                                          191,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 100,
                                            ),
                                            width:
                                                isTablet
                                                    ? (1100 *
                                                        reportviewprovider
                                                            .progress)
                                                    : (300 *
                                                        reportviewprovider
                                                            .progress),

                                            decoration: BoxDecoration(
                                              color: Color(0xFF4A599B),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${(reportviewprovider.progress * 100).toInt()}%', // Convert back to percentage
                                    style: TextStyle(
                                      color: Color(0xFF4A599B),
                                      fontWeight: FontWeight.bold,
                                      fontSize: isTablet ? 22 : 10,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20),
                              // third section
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildStatColumn(
                                    "Total Target",
                                    reportviewprovider.totalTarget,
                                  ),
                                  Container(
                                    width: 2,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  _buildStatColumn(
                                    "Need to Collect",
                                    reportviewprovider.needToCollect,
                                  ),
                                  Container(
                                    width: 2,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  _buildStatColumn(
                                    "Collected Amount",
                                    reportviewprovider.collectedAmount,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              ///
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatColumn(String title, int value) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, color: kPrimaryTextColor)),
        Text(
          "${value}K",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
