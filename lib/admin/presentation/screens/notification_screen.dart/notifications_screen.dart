import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/notification_provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/student_manage_id_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int selectIndex = 0;
  final List<String> classes = ["All", "Fees Updates", "Teacher Updates"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<NotificationProvider>(
          builder: (context, notifucationProvider, _) {
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
                          HeaderandBackwidget(text: 'Notifications'),
                          SizedBox(height: isTablet ? 80 : 40),
                          SizedBox(
                            height: isTablet ? 120 : 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: classes.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    await notifucationProvider.selectClass(
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
                                          notifucationProvider.selectedIndex ==
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
                                            notifucationProvider
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
                            child: Consumer<NotificationProvider>(
                              builder: (context, notifcationprovider, child) {
                                return GestureDetector(
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //   context,
                                    //   '/studentiddetailsscreen',
                                    // );
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
                                        notifcationprovider.isLoading
                                            ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                            : notifcationprovider
                                                .selectedStudents
                                                .isEmpty
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
                                                  notifcationprovider
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
                                                    notifcationprovider
                                                        .selectedStudents[index];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                      69,
                                                      209,
                                                      207,
                                                      207,
                                                    ),
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
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
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
                                                              flex: 10,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Mrs. Carter posted a Daily Update',
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          isTablet
                                                                              ? 32
                                                                              : 16,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 12,
                                                                  ),
                                                                  Text(
                                                                    'Today s attendance reached 95% with strong participation.Key activities included engaging math exercises and group work.',
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          isTablet
                                                                              ? 32
                                                                              : 12,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Flexible(
                                                              flex: 3,
                                                              child: Text(
                                                                '2 hours ago',
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
                  Navigator.pushNamed(context, '/createnotification');
                },
                backgroundColor: kButtonColor,
                icon: Icon(
                  Icons.add,
                  size: isTablet ? 50 : 24, // larger icon for tablet
                  color: kButtonTextColor,
                ),
                label: Text(
                  'Create Notification',
                  style: TextStyle(
                    color: kButtonTextColor,
                    fontSize: isTablet ? 24 : 12, // larger text for tablet
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
