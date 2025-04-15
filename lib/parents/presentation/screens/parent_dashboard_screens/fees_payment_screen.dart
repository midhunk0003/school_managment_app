import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/parents/presentation/provider/payment_provider.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/attendance_history.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/class_shadule_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/payment_history.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/pending_fees_screen.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class FeesPaymentScreen extends StatefulWidget {
  const FeesPaymentScreen({Key? key}) : super(key: key);

  @override
  _FeesPaymentScreenState createState() => _FeesPaymentScreenState();
}

class _FeesPaymentScreenState extends State<FeesPaymentScreen>
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
        body: Consumer<PaymentProvider>(
          builder: (context, paymentprovider, _) {
            return LayoutBuilder(
              builder: (context, constraints) {
                bool isTablet = constraints.maxWidth > 600;

                return Padding(
                  padding:
                      isTablet
                          ? const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 50,
                          )
                          : const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: isTablet ? 40 : 20),
                      HeaderandBackwidget(text: 'Fees Payment'),
                      SizedBox(height: isTablet ? 60 : 30),
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
                            Tab(text: "Pending fees"),
                            Tab(text: "Payment history"),
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
                          children: [
                            PendingFeesScreen(),
                            PaymentHistory(),
                            // Text('Attendance History'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
