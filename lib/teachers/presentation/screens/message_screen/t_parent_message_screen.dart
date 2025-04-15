import 'package:flutter/material.dart';

class TParentMessageScreen extends StatefulWidget {
  const TParentMessageScreen({Key? key}) : super(key: key);

  @override
  _TParentMessageScreenState createState() => _TParentMessageScreenState();
}

class _TParentMessageScreenState extends State<TParentMessageScreen> {
  List<Map<String, dynamic>> messages = [
    {
      'name': 'Mr. John Doe',
      'message': 'Please submit your assignments by Friday.',
      'time': '10:30 AM',
      'isRead': false,
      'incommingMessage': false,
    },
    {
      'name': 'Ms. Emily Smith',
      'message': 'Class test scheduled for next Monday.',
      'time': '9:15 AM',
      'isRead': true,
      'incommingMessage': true,
    },
    {
      'name': 'Dr. Robert Brown',
      'message': 'Parent-teacher meeting this Saturday.',
      'time': '8:00 AM',
      'isRead': false,
      'incommingMessage': false,
    },
    {
      'name': 'Dr. Robert Brown',
      'message': 'Parent-teacher meeting this Saturday.',
      'time': '8:00 AM',
      'isRead': true,
      'incommingMessage': false,
    },
    {
      'name': 'Dr. Robert Brown',
      'message': 'Parent-teacher meeting this Saturday.',
      'time': '8:00 AM',
      'isRead': false,
      'incommingMessage': false,
    },
    {
      'name': 'Dr. Robert Brown',
      'message': 'Parent-teacher meeting this Saturday.',
      'time': '8:00 AM',
      'isRead': false,
      'incommingMessage': false,
    },
    {
      'name': 'Dr. Robert Brown',
      'message': 'Parent-teacher meeting this Saturday.',
      'time': '8:00 AM',
      'isRead': true,
      'incommingMessage': true,
    },
    {
      'name': 'Dr. Robert Brown',
      'message': 'Parent-teacher meeting this Saturday.',
      'time': '8:00 AM',
      'isRead': true,
      'incommingMessage': true,
    },
    {
      'name': 'Dr. Robert Brown',
      'message': 'Parent-teacher meeting this Saturday.',
      'time': '8:00 AM',
      'isRead': false,
      'incommingMessage': false,
    },
    {
      'name': 'Dr. Robert Brown',
      'message': 'Parent-teacher meeting this Saturday.',
      'time': '8:00 AM',
      'isRead': false,
      'incommingMessage': false,
    },
    {
      'name': 'Dr. Robert Brown',
      'message': 'Parent-teacher meeting this Saturday.',
      'time': '8:00 AM',
      'isRead': false,
      'incommingMessage': false,
    },
  ];
  Future<void> _refreshMessages() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    setState(() {
      messages = List.from(messages.reversed); // Reversing list as an example
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600; // Adjust for tablets
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: isTablet ? 40.0 : 16.0),
              child: RefreshIndicator(
                onRefresh: _refreshMessages,
                child: ListView.separated(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: isTablet ? 20.0 : 10.0,
                        vertical: isTablet ? 12.0 : 8.0,
                      ),
                      leading: CircleAvatar(
                        radius:
                            isTablet
                                ? 30
                                : 20, // Adjust avatar size for tablets
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: isTablet ? 30 : 20,
                        ),
                      ),
                      title: Text(
                        message['name'] ?? '',
                        style: TextStyle(
                          fontSize: isTablet ? 20 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        message['message'] ?? '',
                        style: TextStyle(fontSize: isTablet ? 18 : 14),
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            message['time'] ?? '',
                            style: TextStyle(fontSize: isTablet ? 18 : 12),
                          ),
                          message['incommingMessage']
                              ? Expanded(
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFFEE742A),
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                              : message['isRead']
                              ? Icon(Icons.done_all, color: Colors.amber)
                              : Icon(Icons.check),
                        ],
                      ),
                    );
                  },
                  separatorBuilder:
                      (context, index) => SizedBox(height: isTablet ? 15 : 10),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
