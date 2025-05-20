import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/adminhome_provider.dart';
import 'package:shimmer/shimmer.dart';

class AdmindashboardScreen extends StatefulWidget {
  const AdmindashboardScreen({Key? key}) : super(key: key);

  @override
  _AdmindashboardScreenState createState() => _AdmindashboardScreenState();
}

class _AdmindashboardScreenState extends State<AdmindashboardScreen> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AdminhomeProvider>(
        context,
        listen: false,
      ).fetchUpcommingEvents();
    });
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Consumer<AdminhomeProvider>(
              builder: (context, adminhomeProvider, _) {
                return adminhomeProvider.isLoading
                    ? _buildShimmer()
                    : Padding(
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
                      child: RefreshIndicator(
                        onRefresh: _refreshData,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // profile section
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/profilescreen',
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
                                          '/notificationsscreen',
                                        );
                                      },
                                      child: CircleAvatar(
                                        radius: isTablet ? 40 : 20,
                                        backgroundColor: Colors.black,
                                        child: Icon(
                                          Icons.notifications_none_outlined,
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
                                      'Welcome Back, Aditya!',
                                      style: GoogleFonts.josefinSans(
                                        fontSize: isTablet ? 40 : 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Let’s get you day started',
                                      style: GoogleFonts.josefinSans(
                                        fontSize: isTablet ? 25 : 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 30),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFCF9B6),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your School at a Glance',
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: HomescreenFirstSectionWidget(
                                              image: Image.asset(
                                                'assets/images/schoolglance/collectmoney.png',
                                              ),
                                              Text1: 'Fees',
                                              Text2: 'Collected',
                                              Text3: '85%',
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: HomescreenFirstSectionWidget(
                                              image: Image.asset(
                                                'assets/images/schoolglance/upcommingevent.png',
                                              ),
                                              Text1: 'Upcoming',
                                              Text2: 'Events',
                                              Text3: '3',
                                            ),
                                          ),
                                        ],
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
                                  color: const Color(0xFFEEEFF7),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            '/enrolledstudentscreen',
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
                                          text: 'Enrolled Students',
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/manageAdmissionScreen',
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
                                          text: 'Manage Admissions',
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/viewbillingscreen',
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
                                          text: 'View Billing',
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/managestudentidscreen',
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
                                          text: 'Manage IDs',
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/reportoverviewscreen',
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
                                          text: 'Reports Overview',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // 3rd container
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFDF0E7),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Insight & Reports',
                                        style: GoogleFonts.josefinSans(
                                          fontSize: isTablet ? 22 : 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Consumer<AdminhomeProvider>(
                                        builder: (context, homeprovider, _) {
                                          return Container(
                                            width: double.infinity,
                                            height: isTablet ? 210 : 110,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Padding(
                                              padding:
                                                  isTablet
                                                      ? const EdgeInsets.all(30)
                                                      : const EdgeInsets.all(
                                                        10,
                                                      ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:
                                                            isTablet ? 40 : 40,
                                                        height:
                                                            isTablet ? 100 : 50,
                                                        decoration: BoxDecoration(
                                                          color: Colors.orange,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                16,
                                                              ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                17,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/images/reportoverview.png',
                                                          ), // Updated to display the image
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Attendance Trend – This Week',
                                                            style: TextStyle(
                                                              fontSize:
                                                                  isTablet
                                                                      ? 32
                                                                      : 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${(homeprovider.progress * 100).toInt()}% average attendance',
                                                            style: TextStyle(
                                                              fontSize:
                                                                  isTablet
                                                                      ? 32
                                                                      : 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width:
                                                                isTablet
                                                                    ? 500
                                                                    : 250,
                                                            height:
                                                                isTablet
                                                                    ? 16
                                                                    : 8,
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  Colors
                                                                      .grey[300],
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    10,
                                                                  ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                AnimatedContainer(
                                                                  duration:
                                                                      const Duration(
                                                                        milliseconds:
                                                                            100,
                                                                      ),
                                                                  width:
                                                                      isTablet
                                                                          ? 1200 *
                                                                              homeprovider.progress
                                                                          : 250 *
                                                                              homeprovider.progress,
                                                                  decoration: BoxDecoration(
                                                                    color:
                                                                        Colors
                                                                            .orange,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          10,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          '${homeprovider.progress * 100}%',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                isTablet
                                                                    ? 22
                                                                    : 10,
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
                                      ),
                                      SizedBox(height: 10),
                                      Consumer<AdminhomeProvider>(
                                        builder: (context, homeprovider, _) {
                                          return Container(
                                            width: double.infinity,
                                            height: isTablet ? 210 : 110,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Padding(
                                              padding:
                                                  isTablet
                                                      ? const EdgeInsets.all(30)
                                                      : const EdgeInsets.all(
                                                        10,
                                                      ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:
                                                            isTablet ? 40 : 40,
                                                        height:
                                                            isTablet ? 100 : 50,
                                                        decoration: BoxDecoration(
                                                          color: Colors.orange,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                16,
                                                              ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                17,
                                                              ),
                                                          child: Image.asset(
                                                            'assets/images/yourtask/viewbilling.png',
                                                          ), // Updated to display the image
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Fee Collection Progress',
                                                            style: TextStyle(
                                                              fontSize:
                                                                  isTablet
                                                                      ? 32
                                                                      : 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${homeprovider.collectedAmount} Rs collected of ${homeprovider.goalAmount} Rs goal',
                                                            style: TextStyle(
                                                              fontSize:
                                                                  isTablet
                                                                      ? 32
                                                                      : 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            // width: 1000,
                                                            height:
                                                                isTablet
                                                                    ? 16
                                                                    : 8,
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  Colors
                                                                      .grey[300],
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    10,
                                                                  ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                AnimatedContainer(
                                                                  duration:
                                                                      const Duration(
                                                                        milliseconds:
                                                                            100,
                                                                      ),
                                                                  width:
                                                                      isTablet
                                                                          ? 1200 *
                                                                              (homeprovider.collectedAmount /
                                                                                  homeprovider.goalAmount)
                                                                          : 270 *
                                                                              (homeprovider.collectedAmount /
                                                                                  homeprovider.goalAmount),
                                                                  decoration: BoxDecoration(
                                                                    color:
                                                                        Colors
                                                                            .orange,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          10,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          '${((homeprovider.collectedAmount))} Rs',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                isTablet
                                                                    ? 22
                                                                    : 10,
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
                                          ? const EdgeInsets.all(0)
                                          : const EdgeInsets.all(0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                          ? const EdgeInsets.all(
                                                            32,
                                                          )
                                                          : const EdgeInsets.all(
                                                            16,
                                                          ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),

                                                          Container(
                                                            width:
                                                                isTablet
                                                                    ? 60
                                                                    : 30,
                                                            height:
                                                                isTablet
                                                                    ? 60
                                                                    : 30,
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  containerColorsedit[index %
                                                                      containerColorsedit
                                                                          .length], // Change color dynamically
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    8,
                                                                  ),
                                                            ),
                                                            child: Icon(
                                                              Icons.edit,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(
                                                        'Student progress is a multifaceted concept that encompasses academic, social, emotional, and personal growth.',
                                                        style: TextStyle(
                                                          fontSize:
                                                              isTablet
                                                                  ? 22
                                                                  : 14,
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(
                                                        'April 10, 2025 | 3:00 PM – 4:00 PM',
                                                        style: TextStyle(
                                                          fontSize:
                                                              isTablet
                                                                  ? 30
                                                                  : 15,
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
                          ),
                        ),
                      ),
                    );
              },
            );
          },
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
                          color: const Color(0xFF4A599B),
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
                    color: Colors.yellow,
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

// shimmer effect
Widget _buildShimmer() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              // height: 20,
              decoration: BoxDecoration(
                // color: Colors.white,
                // borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(backgroundColor: Colors.white),
                  Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              // child:
            ),
          ),
          SizedBox(height: 20),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              // child:
            ),
          ),
          SizedBox(height: 20),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              // child:
            ),
          ),

          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder:
                (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
          ),
        ],
      ),
    ),
  );
}
