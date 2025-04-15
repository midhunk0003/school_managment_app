import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceHistory extends StatefulWidget {
  const AttendanceHistory({super.key});

  @override
  State<AttendanceHistory> createState() => _AttendanceHistoryState();
}

class _AttendanceHistoryState extends State<AttendanceHistory> {
  DateTime selectedDate = DateTime.now();
  Map<DateTime, String> attendance = {};

  @override
  void initState() {
    super.initState();
    fetchAttendanceData(); // Fetch attendance when screen loads
  }

  Future<void> _refreshData() async {
    // Simulate a network request or data refresh
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // Update your data here
    });
  }

  Future<void> fetchAttendanceData() async {
    // Simulating backend response (Replace with API call)
    List<Map<String, dynamic>> backendResponse = [
      {"date": "2025-03-03", "status": "present"},
      {"date": "2025-03-12", "status": "present"},
      {"date": "2025-03-16", "status": "absent"},
      {"date": "2025-03-23", "status": "leave"},
      {"date": "2025-02-07", "status": "leave"},
      {"date": "2025-02-12", "status": "absent"},
      {"date": "2025-02-24", "status": "absent"},

      {"date": "2025-04-03", "status": "present"},
      {"date": "2025-04-13", "status": "present"},
      {"date": "2025-04-16", "status": "absent"},
      {"date": "2025-04-23", "status": "leave"},
      {"date": "2025-04-07", "status": "leave"},
      {"date": "2025-04-12", "status": "absent"},
      {"date": "2025-04-24", "status": "absent"},
    ];

    Map<DateTime, String> fetchedData = {};
    for (var entry in backendResponse) {
      DateTime date = DateTime.parse(entry["date"]);
      fetchedData[DateTime(date.year, date.month, date.day)] = entry["status"];
    }

    setState(() {
      attendance = fetchedData;
    });
  }

  void _pickMonthYear() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = DateTime(picked.year, picked.month, 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentMonthAttendance = attendance.entries.where(
      (entry) =>
          entry.key.month == selectedDate.month &&
          entry.key.year == selectedDate.year,
    );

    int presentCount =
        currentMonthAttendance.where((e) => e.value == "present").length;
    int absentCount =
        currentMonthAttendance.where((e) => e.value == "absent").length;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFFDCDCDC)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickMonthYear,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('MMMM, yyyy').format(selectedDate),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (String day in [
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat",
                          "Sun",
                        ])
                          Expanded(
                            child: Center(
                              child: Text(
                                day,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    buildCalendar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: buildSummary(
                            'Total Present',
                            presentCount,
                            Colors.green,
                          ),
                        ),
                        // Vertical Divider
                        SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: const Color.fromARGB(255, 199, 199, 199),
                            thickness: 1.5,
                          ),
                        ),
                        Expanded(
                          child: buildSummary(
                            'Total Absent',
                            absentCount,
                            Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildSummary(String? title, int count, Color color) {
    return Container(
      width: 170,
      height: 40,
      decoration: BoxDecoration(
        // color: Colors.amber,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
              // vertical: 2,
            ),
            child: Column(
              children: [
                Text('$title', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('On this month', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),

          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              // color: Colors.black,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: color),
            ),
            child: Center(child: Text('$count')),
          ),
        ],
      ),
    );
  }

  Widget buildCalendar() {
    DateTime firstDay = DateTime(selectedDate.year, selectedDate.month, 1);
    int daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    int startingWeekday = firstDay.weekday; // Monday = 1, Sunday = 7

    List<Widget> days = [];

    // Add empty cells for previous month days
    for (int i = 1; i < startingWeekday; i++) {
      days.add(const SizedBox());
    }

    // Add actual month days
    for (int day = 1; day <= daysInMonth; day++) {
      DateTime currentDate = DateTime(
        selectedDate.year,
        selectedDate.month,
        day,
      );
      days.add(buildDayTile(day, currentDate));
    }

    return GridView.count(shrinkWrap: true, crossAxisCount: 7, children: days);
  }

  Widget buildDayTile(int day, DateTime date) {
    String? status = attendance[date];

    Color borderColor;
    Widget child;

    switch (status) {
      case "present":
        borderColor = Color(0xFF4EA70B);
        child = Column(
          children: [
            Expanded(
              child: Text(day.toString(), style: const TextStyle(fontSize: 14)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 10,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1FDE7),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0xFF4EA70B)),
                  ),
                  child: const Icon(Icons.check, size: 10, color: Colors.green),
                ),
              ),
            ),
          ],
        );
        break;
      case "absent":
        borderColor = const Color(0xFFCB1A20);
        child = Column(
          children: [
            Expanded(
              child: Text(day.toString(), style: const TextStyle(fontSize: 14)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 10,
                  width: 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF0E7),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFFCB1A20)),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 10,
                    weight: 50,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        );
        break;
      case "leave":
        borderColor = const Color(0xFF979797);
        child = Column(
          children: [
            Expanded(
              child: Text(day.toString(), style: const TextStyle(fontSize: 14)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  height: 10,
                  width: 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFF979797),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFF979797)),
                  ),
                  child: Center(
                    child: Text(
                      'Lv',

                      style: TextStyle(
                        fontSize: 8,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Expanded(
            //   child: const Text(
            //     "Lv",
            //     style: TextStyle(
            //       fontSize: 10,
            //       color: Colors.grey,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        );
        break;
      default:
        borderColor = Colors.grey.withOpacity(0.3);
        child = Text(day.toString(), style: const TextStyle(fontSize: 16));
    }

    return GestureDetector(
      onTap: () {
        _showStatusDialog(date);
      },
      child: Container(
        width: 50, // Increased width
        height: 50, // Increased height
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: child),
      ),
    );
  }

  void _showStatusDialog(DateTime date) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Attendance for ${date.day}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _statusButton(date, "Present", Colors.green),
              _statusButton(date, "Absent", Colors.red),
              _statusButton(date, "Leave", Colors.grey),
            ],
          ),
        );
      },
    );
  }

  Widget _statusButton(DateTime date, String label, Color color) {
    return ListTile(
      leading: Icon(Icons.circle, color: color),
      title: Text(label),
      onTap: () {
        setState(() {
          attendance[date] = label.toLowerCase();
        });
        Navigator.pop(context);
      },
    );
  }
}
