import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/admindashboard_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/calender_screen/calender_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/message_screen/message_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/calender_screen/p_calender_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/message_screen/parent_message_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/parent_dashboard_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/calender_screen/teacher_calender_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/message_screen/t_message_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/teacherdashboard_screen.dart';
import 'package:schoolmanagment/widgets/bottomnavbar_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomnavbarWidget extends StatefulWidget {
  final String? userRole;
  const BottomnavbarWidget({Key? key, required this.userRole})
    : super(key: key);

  @override
  _BottomnavbarWidgetState createState() => _BottomnavbarWidgetState();
}

class _BottomnavbarWidgetState extends State<BottomnavbarWidget> {
  late List<Widget> _pages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserRole();
    print('................ : ${widget.userRole}');
  }

  Future<void> _loadUserRole() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? role = prefs.getString('role');
    setState(() {
      _pages = _getPagesForRole(widget.userRole);
    });
  }

  List<Widget> _getPagesForRole(String? role) {
    switch (role?.toLowerCase()) {
      case 'admin':
        return [AdmindashboardScreen(), CalenderScreen(), MessageScreen()];
      case 'teacher':
        return [
          TeacherdashboardScreen(),
          TeacherCalenderScreen(),
          TMessageScreen(),
        ];
      case 'parent':
        return [
          ParentDashboardScreen(),
          PCalenderScreen(),
          ParentMessageScreen(),
        ];
      default:
        return [
          Center(child: Text('🏠 Home', style: TextStyle(fontSize: 24))),
          CalenderScreen(),
          MessageScreen(),
        ];
    }
  }

  // final List<Widget> _pages = [
  //   // Center(child: Text('🏠 Home', style: TextStyle(fontSize: 24))),
  //   AdmindashboardScreen(),
  //   CalenderScreen(),
  //   MessageScreen(),
  // ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomnavbarProvider>(context);
    return Scaffold(
      body: _pages[provider.currentIndex],
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomnavbarProvider>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Define breakpoints for tablet and mobile views
        bool isTablet = constraints.maxWidth > 600;
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isTablet ? 15 : 10,
            horizontal: isTablet ? 30 : 20,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: isTablet ? 40 : 20,
            vertical: isTablet ? 30 : 20,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 20, 17, 17),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isTablet ? 30 : 25),
              topRight: Radius.circular(isTablet ? 30 : 25),
              bottomLeft: Radius.circular(isTablet ? 30 : 25),
              bottomRight: Radius.circular(isTablet ? 30 : 25),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _buildNavItem(
                  Icons.home,
                  "Home",
                  0,
                  provider,
                  isTablet: isTablet,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  Icons.calendar_month,
                  "Calender",
                  1,
                  provider,
                  isTablet: isTablet,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  Icons.message,
                  "Messages",
                  2,
                  provider,
                  isTablet: isTablet,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    BottomnavbarProvider provider, {
    bool isTablet = false,
  }) {
    bool isSelected = provider.currentIndex == index;

    return GestureDetector(
      onTap: () => provider.updateIndex(index),
      child: AnimatedContainer(
        height: isTablet ? 60 : 50,
        width: isTablet ? 120 : 100,
        duration: Duration(milliseconds: 250),
        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF9F9F9) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: isTablet ? 28 : 24,
              color:
                  isSelected ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: isTablet ? 14 : 12,
                color:
                    isSelected
                        ? const Color.fromARGB(255, 0, 0, 0)
                        : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
