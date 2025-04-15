import 'package:flutter/material.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/view_billing_paid_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/view_billing_unpaid_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/message_screen/parents_message_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/message_screen/teachers_message_screen.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
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
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),

                      filled: true,
                      fillColor: Color.fromARGB(255, 236, 235, 235),
                    ),
                  ),
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
                      tabs: [Tab(text: "Teachers"), Tab(text: "Parents")],
                    ),
                  ),
                  SizedBox(height: isTablet ? 40 : 20),
                  // TabBarView should be wrapped inside Expanded to prevent overflow
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        TeachersMessageScreen(),
                        ParentsMessageScreen(),
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
