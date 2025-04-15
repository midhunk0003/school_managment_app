import 'package:flutter/material.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/view_billing_paid_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/view_billing_unpaid_screen.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class ViewBillingScreen extends StatefulWidget {
  const ViewBillingScreen({Key? key}) : super(key: key);

  @override
  State<ViewBillingScreen> createState() => _ViewBillingScreenState();
}

class _ViewBillingScreenState extends State<ViewBillingScreen>
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
                      ? const EdgeInsets.symmetric(horizontal: 40, vertical: 40)
                      : const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: isTablet ? 40 : 20),
                  HeaderandBackwidget(text: 'View Billing'),
                  SizedBox(height: isTablet ? 60 : 30),
                  // TabBar should be inside a Container, not Expanded
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
                      tabs: [Tab(text: "Unpaid"), Tab(text: "paid")],
                    ),
                  ),
                  SizedBox(height: isTablet ? 40 : 20),
                  // TabBarView should be wrapped inside Expanded to prevent overflow
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ViewBillingUnpaidScreen(),
                        ViewBillingPaidScreen(),
                      ],
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
