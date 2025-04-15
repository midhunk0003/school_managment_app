import 'package:flutter/material.dart';
import 'package:schoolmanagment/core/constraints.dart';

class ViewBillingPaidScreen extends StatefulWidget {
  const ViewBillingPaidScreen({Key? key}) : super(key: key);

  @override
  _ViewBillingPaidScreenState createState() => _ViewBillingPaidScreenState();
}

class _ViewBillingPaidScreenState extends State<ViewBillingPaidScreen> {
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
                              color: Color(0xFFF1FDE7),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF4EA70B)),
                            ),
                            child: Center(
                              child: Text(
                                'Paid',
                                style: TextStyle(
                                  color: Color(0xFF4EA70B),
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
                          Navigator.pushNamed(
                            context,
                            '/viewbillingpaymentdetailscreen',
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
                              'View Payment deatils',
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
