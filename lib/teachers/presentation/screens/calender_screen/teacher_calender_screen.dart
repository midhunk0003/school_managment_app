import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/calender_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/teachers/presentation/provider/teacher_calender_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TeacherCalenderScreen extends StatefulWidget {
  const TeacherCalenderScreen({Key? key}) : super(key: key);

  @override
  State<TeacherCalenderScreen> createState() => _TeacherCalenderScreenState();
}

class _TeacherCalenderScreenState extends State<TeacherCalenderScreen> {
  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  List<Color> containerColors = [
    Color(0xFFFDF0E7),
    Color(0xFFF1FDE7),
    Color(0xFFEEEFF7),
  ];
  List<Color> containerColorsedit = [
    Color.fromARGB(255, 228, 221, 34),
    Color(0xFF4EA70B),
    Color(0xFF4A599B),
  ];
  DateTime today = DateTime.now();
  Future<void> _refreshData() async {
    // Simulate a network call or any async operation to refresh data
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update your state here to refresh the UI
    });
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      Provider.of<TeacherCalenderProvider>(
        context,
        listen: false,
      ).selectDate(day);
      Provider.of<TeacherCalenderProvider>(
        context,
        listen: false,
      ).fetchEvents();
    });
  }

  Future<void> fetchEvents() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TeacherCalenderProvider>(
        context,
        listen: false,
      ).fetchEvents();
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
                      ? const EdgeInsets.symmetric(horizontal: 40, vertical: 40)
                      : const EdgeInsets.symmetric(horizontal: 20),
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('selected date : ${today.toString().split(" ")[0]}'),
                    SizedBox(height: isTablet ? 40 : 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFDF0E7),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TableCalendar(
                        locale: 'en_us',
                        rowHeight: 43,
                        focusedDay: today,
                        availableGestures: AvailableGestures.all,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2050, 12, 31),
                        onDaySelected: _onDaySelected,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                      ),
                    ),

                    SizedBox(height: isTablet ? 20 : 10),
                    Consumer<TeacherCalenderProvider>(
                      builder: (context, teachercalenderProvider, _) {
                        if (teachercalenderProvider.isLoading) {
                          return Expanded(
                            child: Container(
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          ); // Loading state
                        }
                        if (teachercalenderProvider.events.isEmpty) {
                          return Expanded(
                            child: Container(
                              child: Center(
                                child: Text(
                                  "No events found!",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ); // Empty state
                        }
                        return Expanded(
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: isTablet ? 20 : 10),
                                Text(
                                  '${teachercalenderProvider.formatDate(today)} ${teachercalenderProvider.getEventTitle(today)}',
                                  style: GoogleFonts.josefinSans(
                                    fontSize: isTablet ? 36 : 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: isTablet ? 20 : 10),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      teachercalenderProvider.events.length,
                                  itemBuilder: (context, index) {
                                    final event =
                                        teachercalenderProvider.events[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color:
                                            containerColors[index %
                                                containerColors
                                                    .length], // Change color dynamically
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding:
                                            isTablet
                                                ? const EdgeInsets.all(40)
                                                : const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${event.title}',
                                                  style: TextStyle(
                                                    fontSize:
                                                        isTablet ? 32 : 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF171717),
                                                  ),
                                                ),
                                                // Container(
                                                //   width: isTablet ? 60 : 30,
                                                //   height: isTablet ? 60 : 30,
                                                //   decoration: BoxDecoration(
                                                //     color:
                                                //         containerColorsedit[index %
                                                //             containerColorsedit
                                                //                 .length], // Change color dynamically
                                                //     borderRadius:
                                                //         BorderRadius.circular(
                                                //           10,
                                                //         ),
                                                //   ),
                                                //   child: Center(
                                                //     child: Icon(
                                                //       Icons.edit,
                                                //       color: Colors.white,
                                                //       size: isTablet ? 35 : 15,
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: isTablet ? 32 : 16,
                                            ),
                                            Text(
                                              '${event.description}',
                                              style: TextStyle(
                                                fontSize: isTablet ? 32 : 15,
                                                color: Color(0xFF484848),
                                              ),
                                            ),
                                            SizedBox(
                                              height: isTablet ? 32 : 16,
                                            ),
                                            Text(
                                              '${teachercalenderProvider.formatDate2(today)} | ${event.startTime} – ${event.endTime}',
                                              style: TextStyle(
                                                color: Color(0xFF2B2B2B),
                                                fontSize: isTablet ? 32 : 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 10);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        // floatingActionButton: LayoutBuilder(
        //   builder: (context, constraints) {
        //     bool isTablet = constraints.maxWidth > 600; // tablet breakpoint

        //     return SizedBox(
        //       width: isTablet ? 300 : 170, // wider on tablet
        //       height: isTablet ? 100 : 50, // taller on tablet
        //       child: FloatingActionButton.extended(
        //         onPressed: () {
        //           // action when clicked
        //           Navigator.pushNamed(context, '/createevents');
        //         },
        //         backgroundColor: kButtonColor,
        //         icon: Icon(
        //           Icons.add,
        //           size: isTablet ? 50 : 24, // larger icon for tablet
        //           color: kButtonTextColor,
        //         ),
        //         label: Text(
        //           'Create event',
        //           style: TextStyle(
        //             color: kButtonTextColor,
        //             fontSize: isTablet ? 30 : 16, // larger text for tablet
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(25),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
