import 'package:flutter/material.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class FieldTripFormsScreen extends StatefulWidget {
  const FieldTripFormsScreen({Key? key}) : super(key: key);

  @override
  _FieldTripFormsScreenState createState() => _FieldTripFormsScreenState();
}

class _FieldTripFormsScreenState extends State<FieldTripFormsScreen> {
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
                                        height: isTablet ? 360 : 180,
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
                                      // Progress Bar
                                      LinearProgressIndicator(
                                        value: 29 / 40, // 0.25 (25% progress),
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          187,
                                          184,
                                          184,
                                        ),
                                        color: Color(0xFF4A599B),
                                        minHeight: isTablet ? 10 : 5,
                                      ),
                                      SizedBox(height: isTablet ? 20 : 10),
                                      Text(
                                        'Parents approved : 29/40',
                                        style: TextStyle(
                                          fontSize: isTablet ? 28 : 14,
                                          fontWeight: FontWeight.w600,
                                          color: kSecondaryTextColor,
                                        ),
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
        floatingActionButton: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600; // tablet breakpoint

            return SizedBox(
              // width: isTablet ? 300 : 170, // wider on tablet
              height: isTablet ? 100 : 50, // taller on tablet
              child: FloatingActionButton.extended(
                onPressed: () {
                  // action when clicked
                  Navigator.pushNamed(context, '/fieldtripformcreate');
                },
                backgroundColor: kButtonColor,
                icon: Icon(
                  Icons.add,
                  size: isTablet ? 50 : 24, // larger icon for tablet
                  color: kButtonTextColor,
                ),
                label: Text(
                  'Create new trip',
                  style: TextStyle(
                    color: kButtonTextColor,
                    fontSize: isTablet ? 30 : 16, // larger text for tablet
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
