import 'package:flutter/material.dart';
import 'package:schoolmanagment/core/constraints.dart';

class PendingFeesScreen extends StatefulWidget {
  const PendingFeesScreen({Key? key}) : super(key: key);

  @override
  _PendingFeesScreenState createState() => _PendingFeesScreenState();
}

class _PendingFeesScreenState extends State<PendingFeesScreen> {
  Future<void> _refreshData() async {
    // Simulate a network request or data refresh
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // Update your data here
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return RefreshIndicator(
              onRefresh: _refreshData,
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 200,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xFFEBEBEB)),
                      ),
                      child: Padding(
                        padding:
                            isTablet
                                ? const EdgeInsets.all(40)
                                : const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: isTablet ? 84 : 42,
                                  width: isTablet ? 84 : 42,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                SizedBox(width: isTablet ? 16 : 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Midterm Tuition Fee',
                                      style: TextStyle(
                                        fontSize: isTablet ? 32 : 16,
                                        color: kPrimaryTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      ' Due: Mar 21, 2025',
                                      style: TextStyle(
                                        fontSize: isTablet ? 24 : 12,
                                        color: Color(0xFFCB1A20),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: isTablet ? 32 : 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tuition Fee',
                                  style: TextStyle(
                                    fontSize: isTablet ? 28 : 14,
                                  ),
                                ),
                                Text(
                                  'Rs 150',
                                  style: TextStyle(
                                    fontSize: isTablet ? 28 : 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isTablet ? 16 : 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Activity Fee',
                                  style: TextStyle(
                                    fontSize: isTablet ? 28 : 14,
                                  ),
                                ),
                                Text(
                                  'Rs 50',
                                  style: TextStyle(
                                    fontSize: isTablet ? 28 : 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isTablet ? 16 : 8),
                            Divider(),
                            SizedBox(height: isTablet ? 16 : 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: isTablet ? 28 : 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Rs 50',
                                  style: TextStyle(
                                    fontSize: isTablet ? 28 : 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isTablet ? 48 : 24),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/paymentscreen');
                              },
                              child: Container(
                                height: isTablet ? 72 : 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(),
                                ),
                                child: Center(
                                  child: Text(
                                    'Pay Now',
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
                  separatorBuilder: (context, index) {
                    return SizedBox(height: isTablet ? 20 : 10);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
