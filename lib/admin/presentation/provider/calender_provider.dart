import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolmanagment/admin/data/model/calender_events_model.dart';

class CalenderProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  bool isLoading = true;
  bool _eventLoading = false;

  bool get eventLoading => _eventLoading;
  List<CalendarEvent> _events = [];

  List<CalendarEvent> get _allEvents => _events;

  List<CalendarEvent> get events =>
      _allEvents
          .where((event) => event.date == selectedDate.toString().split(" ")[0])
          .toList();

  Future<void> fetchEvents() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2)); // Simulating API call

    _events = [
      CalendarEvent(
        date: "2025-04-02",
        startTime: "03:00 PM",
        endTime: "05:00 PM",
        title: "Parent-Teacher Meeting",
        description: "Discuss student progress.",
      ),
      CalendarEvent(
        date: "2025-04-03",
        startTime: "03:00 PM",
        endTime: "05:00 PM",
        title: "Science Fair",
        description: "Annual school science fair.",
      ),

      CalendarEvent(
        date: "2025-04-03",
        startTime: "03:00 PM",
        endTime: "05:00 PM",
        title: "Games",
        description: "football",
      ),
    ];

    isLoading = false;
    notifyListeners();
  }

  void addEvent(CalendarEvent event) {
    _events.add(event);
    notifyListeners();
  }

  void removeEvent(int index) {
    _events.removeAt(index);
    notifyListeners();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners(); // Notify UI to update events
  }

  String getEventTitle(DateTime selectedDate) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime tomorrow = today.add(Duration(days: 1));

    if (selectedDate.year == today.year &&
        selectedDate.month == today.month &&
        selectedDate.day == today.day) {
      return "Today Events";
    } else if (selectedDate.year == tomorrow.year &&
        selectedDate.month == tomorrow.month &&
        selectedDate.day == tomorrow.day) {
      return "Tomorrow Events";
    } else {
      return "Events";
    }
  }

  String formatDate(DateTime date) {
    return DateFormat('dd MMMM').format(date); // Example: 02 April 2025
  }

  String formatDate2(DateTime date) {
    return DateFormat('MMMM dd yyyy').format(date); // Example: 02 April 2025
  }

  Future<void> neweventcreate() async {
    _eventLoading = true;
    notifyListeners();
    // Perform authentication (API call, Firebase, etc.)
    await Future.delayed(Duration(seconds: 2));
    // Replace with actual auth function
    _eventLoading = false;
    notifyListeners();
  }
}
