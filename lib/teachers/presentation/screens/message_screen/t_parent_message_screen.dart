import 'package:flutter/material.dart';
import 'package:schoolmanagment/core/constraints.dart';

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
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/tchatscreen');
                      },
                      child: Container(
                        // decoration: BoxDecoration(border: Border.all()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                // color: Colors.blue,
                                child: Row(
                                  children: [
                                    CircleAvatar(radius: isTablet ? 50 : 25),
                                    SizedBox(width: 12),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            message['name'] ?? '',
                                            style: TextStyle(
                                              color: kPrimaryTextColor,
                                              fontSize: isTablet ? 36 : 18,
                                            ),
                                          ),
                                          Text(
                                            message['message'] ?? '',
                                            style: TextStyle(
                                              color: kPrimaryTextColor,
                                              fontSize: isTablet ? 28 : 14,
                                            ),
                                            overflow:
                                                TextOverflow
                                                    .ellipsis, // or TextOverflow.fade
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              // color: Colors.amber,
                              child: Column(
                                children: [
                                  Text(message['time'] ?? ''),
                                  message['incommingMessage']
                                      ? CircleAvatar(
                                        backgroundColor: Color(0xFFEE742A),
                                        radius: 12,
                                        child: Center(
                                          child: Text(
                                            '1',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                      : message['isRead']
                                      ? Icon(
                                        Icons.done_all,
                                        color: const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ),
                                      )
                                      : Icon(Icons.check),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder:
                      (context, index) => SizedBox(height: isTablet ? 42 : 21),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
