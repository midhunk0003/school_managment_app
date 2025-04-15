import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/teachers/presentation/provider/mark_attendance_provider.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';
import 'package:schoolmanagment/widgets/successdilogebox.dart';

class MarkattendenceScreen extends StatefulWidget {
  const MarkattendenceScreen({Key? key}) : super(key: key);

  @override
  _MarkattendenceScreenState createState() => _MarkattendenceScreenState();
}

class _MarkattendenceScreenState extends State<MarkattendenceScreen> {
  final TextEditingController
  selectDatefilterController = TextEditingController(
    text:
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
  );
  Future<void> _refreshData() async {
    // Simulate a network call or any async operation to refresh data
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update your state here to refresh the UI
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize with today's data
    final provider = Provider.of<MarkAttendanceProvider>(
      context,
      listen: false,
    );
    provider.updateSelectedDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Consumer<MarkAttendanceProvider>(
              builder: (context, studentattendancemarkprovider, _) {
                return Stack(
                  children: [
                    Padding(
                      padding:
                          isTablet
                              ? const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 50,
                              )
                              : const EdgeInsets.symmetric(horizontal: 20),
                      child: RefreshIndicator(
                        onRefresh: _refreshData,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: isTablet ? 40 : 20),
                              HeaderandBackwidget(text: 'Mark Attendance'),
                              SizedBox(height: isTablet ? 80 : 40),
                              Container(
                                width: isTablet ? 340 : 170,
                                height: isTablet ? 80 : 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                ),
                                child: TextField(
                                  controller: selectDatefilterController,
                                  decoration: InputDecoration(
                                    hintText: 'select data filter',
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                  ),
                                  readOnly: true,

                                  onTap: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime.now(),
                                        );
                                    if (picked != null) {
                                      selectDatefilterController.text =
                                          "${picked.day}/${picked.month}/${picked.year}";
                                      // Update the provider's selected date
                                      final provider =
                                          Provider.of<MarkAttendanceProvider>(
                                            context,
                                            listen: false,
                                          );
                                      provider.updateSelectedDate(picked);
                                      // studentattendancemarkprovider
                                      //     .filterByDate(picked);
                                    }

                                    log(
                                      '............. ${selectDatefilterController.text}',
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEFF7),
                                      borderRadius: BorderRadius.circular(16),
                                      // border: Border.all()
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: isTablet ? 100 : 50,
                                                width: isTablet ? 100 : 50,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Color(0xFF4A599B),
                                                ),

                                                child: ClipRect(
                                                  child: Image.asset(
                                                    'assets/images/teacher/markattendanceicon.png',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: isTablet ? 20 : 10,
                                              ),

                                              Consumer<MarkAttendanceProvider>(
                                                builder: (
                                                  context,
                                                  percentMarkAttendProvider,
                                                  _,
                                                ) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Today’s Attendance',
                                                      ),
                                                      Text(
                                                        '${percentMarkAttendProvider.percentage.toString()}%',
                                                        style: TextStyle(
                                                          fontSize:
                                                              isTablet
                                                                  ? 40
                                                                  : 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: isTablet ? 20 : 10),

                                          Consumer<MarkAttendanceProvider>(
                                            builder: (
                                              context,
                                              markAttendanceProvider,
                                              _,
                                            ) {
                                              return Row(
                                                children: [
                                                  attendenceCardWidget(
                                                    isTablet: isTablet,
                                                    title: 'Total',
                                                    value:
                                                        '${markAttendanceProvider.totalStudents.toString()}',
                                                  ),
                                                  SizedBox(
                                                    width: isTablet ? 20 : 10,
                                                  ),
                                                  attendenceCardWidget(
                                                    isTablet: isTablet,
                                                    title: 'Present',
                                                    value:
                                                        '${markAttendanceProvider.presentCount.toString()}',
                                                  ),
                                                  SizedBox(
                                                    width: isTablet ? 20 : 10,
                                                  ),
                                                  attendenceCardWidget(
                                                    isTablet: isTablet,
                                                    title: 'Absent',
                                                    value:
                                                        '${markAttendanceProvider.absentCount.toString()}',
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                          SizedBox(height: isTablet ? 20 : 10),

                                          // Text('Today Marked: 3/40'),
                                          // SizedBox(height: isTablet ? 20 : 10),
                                          // // Progress Bar
                                          // LinearProgressIndicator(
                                          //   value:
                                          //       3 / 40, // 0.25 (25% progress),
                                          //   backgroundColor:
                                          //       const Color.fromARGB(
                                          //         255,
                                          //         187,
                                          //         184,
                                          //         184,
                                          //       ),
                                          //   color: Color(0xFF4A599B),
                                          //   minHeight: isTablet ? 10 : 5,
                                          // ),
                                          SizedBox(height: isTablet ? 40 : 20),
                                          DateFormat('yyyy-MM-dd').format(
                                                    studentattendancemarkprovider
                                                        .selectedDate,
                                                  ) ==
                                                  studentattendancemarkprovider
                                                      .today
                                              ? Container(
                                                height: isTablet ? 80 : 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  border: Border.all(
                                                    color: const Color.fromARGB(
                                                      255,
                                                      190,
                                                      189,
                                                      189,
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Submit to Management',
                                                    style: TextStyle(
                                                      fontSize:
                                                          isTablet ? 24 : 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              : SizedBox.shrink(),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: isTablet ? 60 : 30),
                                  // search form field
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Search by student name',
                                      hintStyle: TextStyle(
                                        color: Color(
                                          0xFFA3A3A3,
                                        ), // Hint text color
                                      ),
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                          color: Color(
                                            0xFFEBEBEB,
                                          ), // default border color
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                          color: Color(
                                            0xFFEBEBEB,
                                          ), // border color when not focused
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                          color: Color(
                                            0xFFEBEBEB,
                                          ), // border color when focused
                                          width: 2.0,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 14.0,
                                        horizontal: 16.0,
                                      ), //
                                      filled: true,
                                      fillColor: Color(0xFFF9F9F9),
                                    ),
                                  ),
                                  SizedBox(height: isTablet ? 40 : 20),

                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        studentattendancemarkprovider
                                            .studentAttendance
                                            .length,
                                    itemBuilder: (context, index) {
                                      final student =
                                          studentattendancemarkprovider
                                              .studentAttendance[index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF9F9F9),
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              isTablet
                                                  ? const EdgeInsets.all(0)
                                                  : const EdgeInsets.all(0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                            isTablet ? 100 : 50,
                                                        width:
                                                            isTablet ? 100 : 50,
                                                        decoration: BoxDecoration(
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            isTablet ? 20 : 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${student.name}',
                                                            style: TextStyle(
                                                              fontSize:
                                                                  isTablet
                                                                      ? 40
                                                                      : 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            'ID : 234567 | Class  : ${student.className}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                0xFF606060,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  DateFormat(
                                                            'yyyy-MM-dd',
                                                          ).format(
                                                            studentattendancemarkprovider
                                                                .selectedDate,
                                                          ) ==
                                                          studentattendancemarkprovider
                                                              .today
                                                      ? Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Switch(
                                                            // thumbColor:
                                                            //     Colors.white,
                                                            thumbColor: MaterialStateProperty.resolveWith<
                                                              Color
                                                            >((
                                                              Set<MaterialState>
                                                              states,
                                                            ) {
                                                              if (states.contains(
                                                                MaterialState
                                                                    .selected,
                                                              )) {
                                                                return const Color.fromARGB(
                                                                  255,
                                                                  248,
                                                                  248,
                                                                  248,
                                                                ); // thumb color when active
                                                              }
                                                              return const Color.fromARGB(
                                                                255,
                                                                255,
                                                                255,
                                                                255,
                                                              ); // thumb color when inactive
                                                            }),
                                                            inactiveTrackColor:
                                                                Color(
                                                                  0xFFCB1A20,
                                                                ),

                                                            activeTrackColor:
                                                                Color(
                                                                  0xFF4EA70B,
                                                                ),
                                                            value:
                                                                student
                                                                    .status ==
                                                                'present',
                                                            onChanged: (value) {
                                                              studentattendancemarkprovider
                                                                  .markAttendance(
                                                                    index,
                                                                    value
                                                                        ? 'present'
                                                                        : 'absent',
                                                                  );
                                                            },
                                                            activeColor:
                                                                Colors.green,
                                                            inactiveThumbColor:
                                                                Colors.red,
                                                          ),
                                                          Text(
                                                            student.status ==
                                                                    'present'
                                                                ? 'Present'
                                                                : 'Absent',
                                                            style: TextStyle(
                                                              color:
                                                                  student.status ==
                                                                          'present'
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .red,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                      : Column(
                                                        children: [
                                                          Container(
                                                            height:
                                                                isTablet
                                                                    ? 60
                                                                    : 30,
                                                            width:
                                                                isTablet
                                                                    ? 60
                                                                    : 30,
                                                            decoration: BoxDecoration(
                                                              shape:
                                                                  BoxShape
                                                                      .circle,
                                                              border: Border.all(
                                                                color:
                                                                    student.status ==
                                                                            'present'
                                                                        ? Color(
                                                                          0xFF4EA70B,
                                                                        )
                                                                        : Color(
                                                                          0xFFCB1A20,
                                                                        ),
                                                              ),
                                                            ),
                                                            child:
                                                                student.status ==
                                                                        'present'
                                                                    ? Icon(
                                                                      Icons
                                                                          .check,
                                                                      size:
                                                                          isTablet
                                                                              ? 24
                                                                              : 12,
                                                                      color: Color(
                                                                        0xFF4EA70B,
                                                                      ),
                                                                    )
                                                                    : Icon(
                                                                      Icons
                                                                          .close,
                                                                      size:
                                                                          isTablet
                                                                              ? 24
                                                                              : 12,
                                                                      color: Color(
                                                                        0xFFCB1A20,
                                                                      ),
                                                                    ),
                                                          ),
                                                          Text(
                                                            student.status ==
                                                                    'present'
                                                                ? 'Present'
                                                                : 'Absent',
                                                            style: TextStyle(
                                                              color:
                                                                  student.status ==
                                                                          'present'
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .red,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // **Full-Screen Loader**
                    if (studentattendancemarkprovider.isLoading)
                      Container(
                        color: Colors.black.withOpacity(
                          0.3,
                        ), // Semi-transparent background
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
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

class attendenceCardWidget extends StatelessWidget {
  final String? title;
  final String? value;
  const attendenceCardWidget({
    super.key,
    required this.isTablet,
    required this.title,
    required this.value,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFF4A599B)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('$title', style: TextStyle(fontSize: isTablet ? 24 : 12)),
              SizedBox(height: isTablet ? 20 : 10),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: isTablet ? 40 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
