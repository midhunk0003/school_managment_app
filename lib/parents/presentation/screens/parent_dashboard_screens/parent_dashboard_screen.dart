import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/adminhome_provider.dart';
import 'package:schoolmanagment/teachers/presentation/provider/teacherdashboard_provider.dart';

class ParentDashboardScreen extends StatefulWidget {
  const ParentDashboardScreen({Key? key}) : super(key: key);

  @override
  _ParentDashboardScreenState createState() => _ParentDashboardScreenState();
}

class _ParentDashboardScreenState extends State<ParentDashboardScreen> {
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
                                      '/pprofilescreen',
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
                                      '/pnotificationscreen',
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
                                  'Hi, Abhinandh',
                                  style: GoogleFonts.josefinSans(
                                    fontSize: isTablet ? 40 : 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Here’s What’s Happening in John’s Class”',
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
                              color: Color(0xFFEEEFF7),
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
                                    'Your Child’s Snapshot',
                                    style: GoogleFonts.josefinSans(
                                      fontSize: isTablet ? 23 : 16,
                                      fontWeight: FontWeight.w600,
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
                                                width: isTablet ? 100 : 40,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF4A599B),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Image.asset(
                                                    width:
                                                        isTablet
                                                            ? 60
                                                            : 30, // Adjust these values as needed
                                                    height: isTablet ? 60 : 30,
                                                    'assets/images/parent/childsnapshor_icons/attensance.png',
                                                  ),
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
                                                    'Attendance',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          isTablet ? 24 : 12,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: isTablet ? 16 : 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'John is Present Today',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              isTablet
                                                                  ? 36
                                                                  : 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            isTablet ? 20 : 10,
                                                      ),
                                                      Container(
                                                        height:
                                                            isTablet ? 36 : 18,
                                                        width:
                                                            isTablet ? 36 : 18,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                5,
                                                              ),
                                                          color: Color(
                                                            0xFF4EA70B,
                                                          ),
                                                        ),
                                                        child: ClipRect(
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.check,
                                                              size:
                                                                  isTablet
                                                                      ? 24
                                                                      : 12,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          // SizedBox(height: isTablet ? 30 : 15),
                                          // Text(
                                          //   'April 22, 2025 | 10:00 AM – 1:00 PM',
                                          //   style: TextStyle(
                                          //     color: Colors.white,
                                          //     fontSize: isTablet ? 24 : 12,
                                          //     fontWeight: FontWeight.w400,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: isTablet ? 24 : 12),
                                  // second container
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: isTablet ? 100 : 50,
                                                    width: isTablet ? 100 : 40,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF4A599B),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            16,
                                                          ),
                                                    ),
                                                    child: FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Image.asset(
                                                        width:
                                                            isTablet
                                                                ? 60
                                                                : 30, // Adjust these values as needed
                                                        height:
                                                            isTablet ? 60 : 30,
                                                        'assets/images/parent/childsnapshor_icons/pendingfee.png',
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    width: isTablet ? 20 : 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Pending Fees',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              isTablet
                                                                  ? 24
                                                                  : 12,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            isTablet ? 16 : 8,
                                                      ),
                                                      Text(
                                                        '₹20,000 Due',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              isTablet
                                                                  ? 36
                                                                  : 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              Container(
                                                width: isTablet ? 180 : 90,
                                                height: isTablet ? 80 : 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      isTablet
                                                          ? BorderRadius.circular(
                                                            40,
                                                          )
                                                          : BorderRadius.circular(
                                                            20,
                                                          ),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Pay',

                                                    style: TextStyle(
                                                      fontSize:
                                                          isTablet ? 25 : 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: isTablet ? 30 : 15),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: isTablet ? 8 : 4),
                                              Text(
                                                'Due: April 10, 2025',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: isTablet ? 24 : 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: isTablet ? 24 : 12),
                                  // third container
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
                                                width: isTablet ? 100 : 40,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF4A599B),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Image.asset(
                                                    width:
                                                        isTablet
                                                            ? 60
                                                            : 30, // Adjust these values as needed
                                                    height: isTablet ? 60 : 30,
                                                    'assets/images/parent/childsnapshor_icons/attensance.png',
                                                  ),
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
                                                    'Next Exam',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          isTablet ? 24 : 12,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: isTablet ? 16 : 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Math Test, April 15',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              isTablet
                                                                  ? 36
                                                                  : 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            isTablet ? 20 : 10,
                                                      ),
                                                      // Container(
                                                      //   height:
                                                      //       isTablet ? 36 : 18,
                                                      //   width:
                                                      //       isTablet ? 36 : 18,
                                                      //   decoration: BoxDecoration(
                                                      //     borderRadius:
                                                      //         BorderRadius.circular(
                                                      //           5,
                                                      //         ),
                                                      //     color: Color(
                                                      //       0xFF4EA70B,
                                                      //     ),
                                                      //   ),
                                                      //   child: ClipRect(
                                                      //     child: Center(
                                                      //       child: Icon(
                                                      //         Icons.check,
                                                      //         size:
                                                      //             isTablet
                                                      //                 ? 24
                                                      //                 : 12,
                                                      //         color:
                                                      //             Colors.white,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          // SizedBox(height: isTablet ? 30 : 15),
                                          // Text(
                                          //   'April 22, 2025 | 10:00 AM – 1:00 PM',
                                          //   style: TextStyle(
                                          //     color: Colors.white,
                                          //     fontSize: isTablet ? 24 : 12,
                                          //     fontWeight: FontWeight.w400,
                                          //   ),
                                          // ),
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
                                        '/childprofilescreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/parent/quicklink/childprofile.png',
                                      ),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: isTablet ? 40 : 20,
                                      ),
                                      text: 'Child Profile',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/feespaymentscreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/parent/quicklink/feespayment.png',
                                      ),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: isTablet ? 40 : 20,
                                      ),
                                      text: 'Fees Payment',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/passignmentscreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/parent/quicklink/assignment.png',
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
                                        '/pgalleryscreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/parent/quicklink/gallery.png',
                                      ),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: isTablet ? 40 : 20,
                                      ),
                                      text: 'Gallery (View Only)',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/pfieldtripscreen',
                                      );
                                    },
                                    child: YourTaskWidget(
                                      image: Image.asset(
                                        'assets/images/parent/quicklink/tripplanform.png',
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
                          color: Color(0xFFEE742A),
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
