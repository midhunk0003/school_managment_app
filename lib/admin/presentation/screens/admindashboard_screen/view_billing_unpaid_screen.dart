import 'package:flutter/material.dart';
import 'package:schoolmanagment/core/constraints.dart';

class ViewBillingUnpaidScreen extends StatefulWidget {
  const ViewBillingUnpaidScreen({Key? key}) : super(key: key);

  @override
  _ViewBillingUnpaidScreenState createState() =>
      _ViewBillingUnpaidScreenState();
}

class _ViewBillingUnpaidScreenState extends State<ViewBillingUnpaidScreen> {
  Future<void> _refreshData() async {
    // Simulate fetching new data
    await Future.delayed(const Duration(seconds: 2));
    setState(() {}); // Rebuild the widget to reflect new data if necessary
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        return RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 236, 236),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFFCDCDCD)),
                ),
                child: Padding(
                  padding:
                      isTablet
                          ? const EdgeInsets.all(40)
                          : const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: isTablet ? 100 : 50,
                                width: isTablet ? 100 : 50,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              SizedBox(width: isTablet ? 20 : 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Child name',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        90,
                                        90,
                                        90,
                                      ),
                                      fontSize: isTablet ? 24 : 12,
                                    ),
                                  ),
                                  Text(
                                    'Elina',
                                    style: TextStyle(
                                      color: kPrimaryTextColor,
                                      fontSize: isTablet ? 40 : 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: isTablet ? 60 : 30,
                            width: isTablet ? 200 : 100,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFCE8E9),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFCB1A20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'UnPaid',
                                style: TextStyle(
                                  color: const Color(0xFFCB1A20),
                                  fontSize: isTablet ? 24 : 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Parent Name',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      90,
                                      90,
                                      90,
                                    ),
                                    fontSize: isTablet ? 24 : 12,
                                  ),
                                ),
                                Text(
                                  'John Doe',
                                  style: TextStyle(
                                    color: kPrimaryTextColor,
                                    fontSize: isTablet ? 40 : 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fee Type',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      90,
                                      90,
                                      90,
                                    ),
                                    fontSize: isTablet ? 24 : 12,
                                  ),
                                ),
                                Text(
                                  'Tuition Fee',
                                  style: TextStyle(
                                    color: kPrimaryTextColor,
                                    fontSize: isTablet ? 40 : 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 3),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amount Due',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      90,
                                      90,
                                      90,
                                    ),
                                    fontSize: isTablet ? 24 : 12,
                                  ),
                                ),
                                Text(
                                  '250.00',
                                  style: TextStyle(
                                    color: kPrimaryTextColor,
                                    fontSize: isTablet ? 40 : 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Due Date',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      90,
                                      90,
                                      90,
                                    ),
                                    fontSize: isTablet ? 24 : 12,
                                  ),
                                ),
                                Text(
                                  '21-02-2025',
                                  style: TextStyle(
                                    color: kPrimaryTextColor,
                                    fontSize: isTablet ? 40 : 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      // button
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              // Auto close after 1 second
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.of(context).pop();
                              });
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: isTablet ? 600 : 300,
                                  width: isTablet ? 600 : 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: isTablet ? 120 : 60,
                                        height: isTablet ? 120 : 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/successmanagadmission.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Send Reminder',
                                        style: TextStyle(
                                          color: kPrimaryTextColor,
                                          fontSize: isTablet ? 40 : 20,
                                        ),
                                      ),
                                      Text(
                                        'Successfully',
                                        style: TextStyle(
                                          color: kPrimaryTextColor,
                                          fontSize: isTablet ? 40 : 20,
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height:
                                      //       10,
                                      // ),
                                      // Text(
                                      //   'Now you can view this student in the Enrolled',
                                      //   style: TextStyle(
                                      //     fontSize:
                                      //         12,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   'Students list',
                                      //   style: TextStyle(
                                      //     fontSize:
                                      //         12,
                                      //   ),
                                      // ),
                                      SizedBox(height: isTablet ? 40 : 20),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: isTablet ? 80 : 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                            border: Border.all(),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Ok',
                                              style: TextStyle(
                                                fontSize: isTablet ? 24 : 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: isTablet ? 80 : 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(),
                          ),
                          child: Center(
                            child: Text(
                              'Send Reminder',
                              style: TextStyle(fontSize: isTablet ? 24 : 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
        );
      },
    );
  }
}
