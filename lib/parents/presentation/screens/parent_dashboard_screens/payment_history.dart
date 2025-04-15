import 'package:flutter/material.dart';
import 'package:schoolmanagment/core/constraints.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: isTablet ? 84 : 42,
                                  width: isTablet ? 84 : 42,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4EA70B),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 25,
                                      // weight: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(width: isTablet ? 16 : 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tuition Fee Payment',
                                      style: TextStyle(
                                        fontSize: isTablet ? 32 : 16,
                                        color: kPrimaryTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Paid: Jan 15, 2025',
                                      style: TextStyle(
                                        fontSize: isTablet ? 24 : 12,
                                        color: Color(0xFF4EA70B),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: isTablet ? 32 : 16),
                            Text(
                              'Payment of Rs150.00 processed successfully, ',
                              style: TextStyle(fontSize: isTablet ? 28 : 14),
                            ),
                            Text(
                              'Transaction ID: TXN456789.',
                              style: TextStyle(fontSize: isTablet ? 28 : 14),
                            ),
                            SizedBox(height: isTablet ? 48 : 24),
                            Container(
                              height: isTablet ? 72 : 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(),
                              ),
                              child: Center(
                                child: Text(
                                  'View receipt',
                                  style: TextStyle(
                                    fontSize: isTablet ? 24 : 12,
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
