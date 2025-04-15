import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/adminhome_provider.dart';
import 'package:schoolmanagment/teachers/presentation/provider/teacherdashboard_provider.dart';

class TeacherdashboardScreen extends StatefulWidget {
  const TeacherdashboardScreen({Key? key}) : super(key: key);

  @override
  _TeacherdashboardScreenState createState() => _TeacherdashboardScreenState();
}

class _TeacherdashboardScreenState extends State<TeacherdashboardScreen> {
  List<Color> containerColors = [
    Color(0xFFFDF0E7),
    Color(0xFFF1FDE7),
    Color(0xFFEEEFF7),
  ];
  List<Color> containerColorsedit = [
    Color.fromARGB(255, 228, 221, 34),
    Color(0xFF4EA70B),
    Color(0xFF4A599B),
  ];

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
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Consumer<TeacherdashboardProvider>(
                    builder: (context, teacherprovider, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // profile section
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/tProfilescreen',
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: isTablet ? 40 : 25,
                                    backgroundColor: Colors.black,
                                    foregroundImage: AssetImage(
                                      'assets/images/profile.jpeg',
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/tNotificationscreen',
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: isTablet ? 40 : 20,
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.notifications_none_outlined,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // welcome text section
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, Mr. Vishnu!',
                                  style: GoogleFonts.josefinSans(
                                    fontSize: isTablet ? 40 : 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Ready to Inspire?',
                                  style: GoogleFonts.josefinSans(
                                    fontSize: isTablet ? 24 : 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFDF0E7),
                              // color: const Color.fromARGB(255, 151, 139, 102),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  isTablet
                                      ? const EdgeInsets.symmetric(
                                        horizontal: 50,
                                        vertical: 50,
                                      )
                                      : const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 20,
                                      ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Class Snapshot',
                                    style: GoogleFonts.josefinSans(
                                      fontSize: isTablet ? 23 : 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: HomescreenFirstSectionWidget(
                                          image: Image.asset(
                                            'assets/images/schoolglance/Group.png',
                                          ),
                                          Text1: 'Total',
                                          Text2: 'Students',
                                          Text3: '512',
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: HomescreenFirstSectionWidget(
                                          image: Image.asset(
                                            'assets/images/schoolglance/atrate.png',
                                          ),
                                          Text1: 'Attendance',
                                          Text2: 'Rate',
                                          Text3: '95%',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(),
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
                                                height: isTablet ? 80 : 40,
                                                width: isTablet ? 80 : 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Color(0xFFEE742A),
                                                ),
                                              ),
                                              SizedBox(
                                                width: isTablet ? 20 : 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Today’s Attendance',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          isTablet ? 24 : 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${teacherprovider.attendancePercentage.toStringAsFixed(0)}%",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          isTablet ? 48 : 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: isTablet ? 40 : 20),
                                          Row(
                                            children: [
                                              InfoCardHomeWidget(
                                                title: 'Total',
                                                value: '32',
                                                isTablet: isTablet,
                                              ),
                                              SizedBox(
                                                width: isTablet ? 24 : 12,
                                              ),
                                              InfoCardHomeWidget(
                                                title: 'Present',
                                                value: '28',
                                                isTablet: isTablet,
                                              ),
                                              SizedBox(
                                                width: isTablet ? 24 : 12,
                                              ),
                                              InfoCardHomeWidget(
                                                title: 'Adsent',
                                                value: '04',
                                                isTablet: isTablet,
                                              ),
                                              SizedBox(width: 16),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            isTablet ? 120 : 60,
                                                        height:
                                                            isTablet ? 120 : 60,
                                                        child: CircularProgressIndicator(
                                                          value:
                                                              teacherprovider
                                                                  .attendancePercentage /
                                                              100,
                                                          color: Color(
                                                            0xFFEE742A,
                                                          ),
                                                          backgroundColor:
                                                              Colors
                                                                  .grey
                                                                  .shade800,
                                                          strokeWidth: 5,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${teacherprovider.attendancePercentage.toStringAsFixed(0)}%",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: isTablet ? 20 : 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: isTablet ? 20 : 10),

                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.black,
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
                                          Row(
                                            children: [
                                              Container(
                                                height: isTablet ? 100 : 50,
                                                width: isTablet ? 100 : 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEE742A),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              SizedBox(
                                                width: isTablet ? 20 : 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Next Field Trip',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          isTablet ? 24 : 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Zoo Visit',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          isTablet ? 36 : 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: isTablet ? 30 : 15),

                                          Text(
                                            'April 22, 2025 | 10:00 AM – 1:00 PM',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: isTablet ? 24 : 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // second container
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFCE8E9),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  isTablet
                                      ? const EdgeInsets.symmetric(
                                        horizontal: 50,
                                        vertical: 50,
                                      )
                                      : const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 20,
                                      ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Tasks, One Tap Away',
                                    style: GoogleFonts.josefinSans(
                                      fontSize: isTablet ? 22 : 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/markattendencescreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/yourtask/enroll.png',
                                      ),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: isTablet ? 40 : 20,
                                      ),
                                      text: 'Mark Attendance',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/dailyupdatescreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/yourtask/managaddminsion.png',
                                      ),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: isTablet ? 40 : 20,
                                      ),
                                      text: 'Daily Update',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/assignmentscreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/yourtask/viewbilling.png',
                                      ),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: isTablet ? 40 : 20,
                                      ),
                                      text: 'Assignment',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/galleryscreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/yourtask/manageid.png',
                                      ),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: isTablet ? 40 : 20,
                                      ),
                                      text: 'Gallery',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/fieldtripformsscreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/yourtask/report.png',
                                      ),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: isTablet ? 40 : 20,
                                      ),
                                      text: 'Field Trip Forms',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          /// last upcomming events
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // color: const Color.fromARGB(41, 68, 137, 255),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding:
                                  isTablet
                                      ? const EdgeInsets.all(20)
                                      : const EdgeInsets.all(0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Upcoming Events',
                                    style: GoogleFonts.josefinSans(
                                      fontSize: isTablet ? 20 : 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 12),

                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            // height: 170,
                                            decoration: BoxDecoration(
                                              color:
                                                  containerColors[index %
                                                      containerColors
                                                          .length], // Change color dynamically
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Padding(
                                              padding:
                                                  isTablet
                                                      ? const EdgeInsets.all(32)
                                                      : const EdgeInsets.all(
                                                        16,
                                                      ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Parent-Teacher Meeting',
                                                        style: TextStyle(
                                                          fontSize:
                                                              isTablet
                                                                  ? 40
                                                                  : 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),

                                                      // Container(
                                                      //   width:
                                                      //       isTablet ? 60 : 30,
                                                      //   height:
                                                      //       isTablet ? 60 : 30,
                                                      //   decoration: BoxDecoration(
                                                      //     color:
                                                      //         containerColorsedit[index %
                                                      //             containerColorsedit
                                                      //                 .length], // Change color dynamically
                                                      //     borderRadius:
                                                      //         BorderRadius.circular(
                                                      //           8,
                                                      //         ),
                                                      //   ),
                                                      //   child: Icon(
                                                      //     Icons.edit,
                                                      //     color: Colors.white,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
                                                    style: TextStyle(
                                                      fontSize:
                                                          isTablet ? 22 : 14,
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    'April 10, 2025 | 3:00 PM – 4:00 PM',
                                                    style: TextStyle(
                                                      fontSize:
                                                          isTablet ? 30 : 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class InfoCardHomeWidget extends StatelessWidget {
  final String? title;
  final String? value;
  const InfoCardHomeWidget({
    super.key,
    required this.isTablet,
    required this.title,
    required this.value,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.orange),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '$title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 24 : 12,
                ),
              ),
              Text(
                '$value',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 46 : 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YourTaskWidget extends StatelessWidget {
  final Icon icon;
  final String? text;
  final Image image;
  const YourTaskWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        return Container(
          width: double.infinity,
          height: isTablet ? 120 : 60,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding:
                isTablet ? const EdgeInsets.all(20) : const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: isTablet ? 100 : 60,
                        height: isTablet ? 80 : 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFCB1A20),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: image, // Updated to display the image
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '$text',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 40 : 20,
                          ),
                          overflow:
                              TextOverflow.ellipsis, // optional for long text
                        ),
                      ),
                    ],
                  ),
                ),

                icon,
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomescreenFirstSectionWidget extends StatelessWidget {
  final Image image;
  final String? Text1;
  final String? Text2;
  final String? Text3;

  const HomescreenFirstSectionWidget({
    super.key,
    required this.Text1,
    required this.Text2,
    required this.Text3,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;

        // // Sizes depending on device
        // double containerHeight = isTablet ? 200 : 100;
        // double containerWidth = isTablet ? 300 : 170;
        double iconSize = isTablet ? 60 : 40;
        double iconContainerSize = isTablet ? 90 : 70;
        double textFontSize = isTablet ? 20 : 14;
        double valueFontSize = isTablet ? 28 : 23;

        return Container(
          height: isTablet ? 400 : 100,
          width: isTablet ? 300 : 170,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: isTablet ? 400 : 200,
                  width: isTablet ? 200 : 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFEE742A),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: image, // Updated to display the image
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '$Text1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: textFontSize,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '$Text2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: textFontSize,
                          ),
                        ),
                      ),
                      SizedBox(height: isTablet ? 12 : 8),
                      Text(
                        '$Text3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: valueFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
