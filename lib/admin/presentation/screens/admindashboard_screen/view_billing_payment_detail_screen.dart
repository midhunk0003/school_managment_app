import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class ViewBillingPaymentDetailScreen extends StatefulWidget {
  const ViewBillingPaymentDetailScreen({Key? key}) : super(key: key);

  @override
  _ViewBillingPaymentDetailScreenState createState() =>
      _ViewBillingPaymentDetailScreenState();
}

class _ViewBillingPaymentDetailScreenState
    extends State<ViewBillingPaymentDetailScreen> {
  Future<void> _refreshData() async {
    // Simulate fetching new data
    await Future.delayed(const Duration(seconds: 2));
    setState(() {}); // Rebuild the widget to reflect new data if necessary
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
                      ? const EdgeInsets.all(40)
                      : const EdgeInsets.all(20),
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      HeaderandBackwidget(text: 'Payment Details'),
                      SizedBox(height: isTablet ? 60 : 30),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFFCDCDCD)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                height: isTablet ? 50 : 25,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4A599B),
                                ),
                                child: Padding(
                                  padding:
                                      isTablet
                                          ? const EdgeInsets.only(
                                            left: 20,
                                            top: 6,
                                          )
                                          : const EdgeInsets.only(
                                            left: 10,
                                            top: 3,
                                          ),
                                  child: Text(
                                    'Student & Payment Overview:',
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
                              SizedBox(height: isTablet ? 24 : 12),
                              // first section
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Child name',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              90,
                                              90,
                                              90,
                                            ),
                                            fontSize: isTablet ? 24 : 12,
                                          ),
                                        ),
                                        Text(
                                          'John Doe',
                                          style: TextStyle(
                                            color: kPrimaryTextColor,
                                            fontSize: isTablet ? 40 : 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Paid Amount',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              90,
                                              90,
                                              90,
                                            ),
                                            fontSize: isTablet ? 24 : 12,
                                          ),
                                        ),
                                        Text(
                                          'Tuition Fee',
                                          style: TextStyle(
                                            color: kPrimaryTextColor,
                                            fontSize: isTablet ? 40 : 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // second section
                              Container(
                                height: isTablet ? 50 : 25,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4A599B),
                                ),
                                child: Padding(
                                  padding:
                                      isTablet
                                          ? const EdgeInsets.only(
                                            left: 20,
                                            top: 6,
                                          )
                                          : const EdgeInsets.only(
                                            left: 10,
                                            top: 3,
                                          ),
                                  child: Text(
                                    'Fee Breakdown:',
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tuition Fee',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              90,
                                              90,
                                              90,
                                            ),
                                            fontSize: isTablet ? 24 : 12,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Activity Fee',
                                          style: TextStyle(
                                            color: kPrimaryTextColor,
                                            fontSize: isTablet ? 40 : 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Rs 150',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              90,
                                              90,
                                              90,
                                            ),
                                            fontSize: isTablet ? 24 : 14,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Rs 50',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              90,
                                              90,
                                              90,
                                            ),
                                            fontSize: isTablet ? 24 : 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // third section
                              SizedBox(height: 20),
                              Container(
                                height: isTablet ? 50 : 25,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4A599B),
                                ),
                                child: Padding(
                                  padding:
                                      isTablet
                                          ? const EdgeInsets.only(
                                            left: 20,
                                            top: 6,
                                          )
                                          : const EdgeInsets.only(
                                            left: 10,
                                            top: 3,
                                          ),
                                  child: Text(
                                    'Payment Information',
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
                              SizedBox(height: isTablet ? 24 : 12),
                              // first section
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Payment Method',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              90,
                                              90,
                                              90,
                                            ),
                                            fontSize: isTablet ? 24 : 12,
                                          ),
                                        ),
                                        Text(
                                          'Net Banking',
                                          style: TextStyle(
                                            color: kPrimaryTextColor,
                                            fontSize: isTablet ? 40 : 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Payment Date',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              90,
                                              90,
                                              90,
                                            ),
                                            fontSize: isTablet ? 24 : 12,
                                          ),
                                        ),
                                        Text(
                                          'April 9, 2025',
                                          style: TextStyle(
                                            color: kPrimaryTextColor,
                                            fontSize: isTablet ? 40 : 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),

                              Container(
                                height: isTablet ? 80 : 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(),
                                ),
                                child: Center(
                                  child: Text(
                                    'Make receipt',
                                    style: TextStyle(
                                      fontSize: isTablet ? 24 : 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
