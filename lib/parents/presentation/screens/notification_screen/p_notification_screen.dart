import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/notification_provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/student_manage_id_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class PNotificationScreen extends StatefulWidget {
  const PNotificationScreen({Key? key}) : super(key: key);

  @override
  _PNotificationScreenState createState() => _PNotificationScreenState();
}

class _PNotificationScreenState extends State<PNotificationScreen> {
  int selectIndex = 0;
  final List<String> classes = ["All", "Fees Updates", "Teacher Updates"];

  List<Color> containerColors = [
    Color(0xFFEE742A),
    Color(0xFFCB1A20),
    Color(0xFFF6EE23),
    Color(0xFF4A599B),
  ];
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

                          Expanded(
                            child: Consumer<NotificationProvider>(
                              builder: (context, notifcationprovider, child) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: double.infinity,
                                    padding:
                                        isTablet
                                            ? const EdgeInsets.all(25)
                                            : const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
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
                                                "No Notification available",
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
                                                    color: Color(0xFFEBEBEB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          16,
                                                        ),
                                                    border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                            47,
                                                            158,
                                                            158,
                                                            158,
                                                          ),
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
                                                                  shape:
                                                                      BoxShape
                                                                          .circle,
                                                                  color:
                                                                      containerColors[index %
                                                                          containerColors
                                                                              .length],
                                                                  // borderRadius:
                                                                  //     BorderRadius.circular(
                                                                  //       8,
                                                                  //     ),
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
      ),
    );
  }
}
