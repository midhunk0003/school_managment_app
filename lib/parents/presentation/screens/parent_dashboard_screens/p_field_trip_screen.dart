import 'package:flutter/material.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class PFieldTripScreen extends StatefulWidget {
  const PFieldTripScreen({Key? key}) : super(key: key);

  @override
  _PFieldTripScreenState createState() => _PFieldTripScreenState();
}

class _PFieldTripScreenState extends State<PFieldTripScreen> {
  Future<void> _refreshData() async {
    // Simulate a network call or any async operation to refresh data
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update your state here to refresh the UI
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
                      ? const EdgeInsets.symmetric(horizontal: 50, vertical: 50)
                      : const EdgeInsets.symmetric(horizontal: 20),
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: Column(
                  children: [
                    SizedBox(height: isTablet ? 40 : 20),
                    HeaderandBackwidget(text: 'Field Trip List'),
                    SizedBox(height: isTablet ? 80 : 40),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius:
                                      isTablet
                                          ? BorderRadius.circular(32)
                                          : BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding:
                                      isTablet
                                          ? const EdgeInsets.all(40)
                                          : const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: isTablet ? 700 : 350,
                                        height: isTablet ? 600 : 180,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              isTablet
                                                  ? BorderRadius.circular(32)
                                                  : BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/teacher/fieldtripform/fieldtripformimage.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: isTablet ? 20 : 10),
                                      Text(
                                        'Fairy Tale Forest Walk',
                                        style: TextStyle(
                                          fontSize: isTablet ? 36 : 18,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryTextColor,
                                        ),
                                      ),
                                      SizedBox(height: isTablet ? 20 : 10),
                                      Text(
                                        'Meet costumed characters from your favorite fairy tales. Participate in storytelling and craft activities in a magical setting',
                                        style: TextStyle(
                                          fontSize: isTablet ? 28 : 14,
                                          fontWeight: FontWeight.w500,
                                          color: kSecondaryTextColor,
                                        ),
                                      ),
                                      SizedBox(height: isTablet ? 20 : 10),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Color(0xFF4A599B),
                                          ),
                                          Text(
                                            'Enchanted Woods, Springfield',
                                            style: TextStyle(
                                              fontSize: isTablet ? 28 : 14,
                                              fontWeight: FontWeight.w600,
                                              color: kSecondaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: isTablet ? 20 : 10),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                color: Color(0xFF4A599B),
                                              ),
                                              Text(
                                                'July 12, 2025',
                                                style: TextStyle(
                                                  fontSize: isTablet ? 28 : 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: kSecondaryTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: isTablet ? 40 : 20),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.timelapse,
                                                color: Color(0xFF4A599B),
                                              ),
                                              Text(
                                                '11:00 AM – 3:00 PM',
                                                style: TextStyle(
                                                  fontSize: isTablet ? 28 : 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: kSecondaryTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: isTablet ? 20 : 10),

                                      Text(
                                        'Will your child be attending?',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: isTablet ? 20 : 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: isTablet ? 72 : 36,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    isTablet
                                                        ? BorderRadius.circular(
                                                          50,
                                                        )
                                                        : BorderRadius.circular(
                                                          25,
                                                        ),
                                              ),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'No',
                                                      style: TextStyle(
                                                        fontSize:
                                                            isTablet ? 28 : 14,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: isTablet ? 10 : 5,
                                                    ),
                                                    Container(
                                                      width: isTablet ? 30 : 15,
                                                      height:
                                                          isTablet ? 30 : 15,
                                                      decoration: BoxDecoration(
                                                        // color: Colors.blue,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(),
                                                      ),
                                                      child: Icon(
                                                        Icons.close,
                                                        size:
                                                            isTablet ? 24 : 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: isTablet ? 20 : 10),
                                          Expanded(
                                            child: Container(
                                              height: isTablet ? 72 : 36,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    isTablet
                                                        ? BorderRadius.circular(
                                                          50,
                                                        )
                                                        : BorderRadius.circular(
                                                          25,
                                                        ),
                                              ),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'yes',
                                                      style: TextStyle(
                                                        fontSize:
                                                            isTablet ? 28 : 14,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: isTablet ? 10 : 5,
                                                    ),
                                                    Container(
                                                      width: isTablet ? 30 : 15,
                                                      height:
                                                          isTablet ? 30 : 15,
                                                      decoration: BoxDecoration(
                                                        // color: Colors.blue,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(),
                                                      ),
                                                      child: Icon(
                                                        Icons.check,
                                                        size:
                                                            isTablet ? 24 : 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: isTablet ? 40 : 20);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
