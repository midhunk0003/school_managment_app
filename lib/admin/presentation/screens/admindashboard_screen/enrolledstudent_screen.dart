import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/enroll_student_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';
import 'package:shimmer/shimmer.dart';

class EnrolledstudentScreen extends StatefulWidget {
  const EnrolledstudentScreen({Key? key}) : super(key: key);

  @override
  _EnrolledstudentScreenState createState() => _EnrolledstudentScreenState();
}

class _EnrolledstudentScreenState extends State<EnrolledstudentScreen> {
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
      Provider.of<EnrollStudentProvider>(
        context,
        listen: false,
      ).fetchEnrolledStudent();
    });
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Consumer<EnrollStudentProvider>(
              builder: (context, enrollstudentProvider, _) {
                return enrollstudentProvider.isloading
                    ? EnrolledStudentsShimmerLoading()
                    : Padding(
                      padding:
                          isTablet
                              ? const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 40,
                              )
                              : const EdgeInsets.symmetric(horizontal: 20),
                      child: RefreshIndicator(
                        onRefresh: _refreshData,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              HeaderandBackwidget(text: 'Enrolled Students'),
                              SizedBox(height: isTablet ? 40 : 20),
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size:
                                        MediaQuery.of(context).size.width > 600
                                            ? 32
                                            : 24,
                                  ),
                                  hintText: 'Search by student name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width > 600
                                            ? 18
                                            : 14,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width > 600
                                            ? 24
                                            : 12,
                                    vertical:
                                        MediaQuery.of(context).size.width > 600
                                            ? 20
                                            : 12,
                                  ),
                                  filled: true,
                                ),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width > 600
                                          ? 18
                                          : 14,
                                ),
                                onChanged: (value) {
                                  print('search');
                                },
                              ),
                              SizedBox(height: isTablet ? 40 : 20),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            50,
                                            96,
                                            125,
                                            139,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              isTablet
                                                  ? const EdgeInsets.all(40)
                                                  : const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:
                                                            isTablet
                                                                ? 200
                                                                : 100,
                                                        height:
                                                            isTablet
                                                                ? 200
                                                                : 100,
                                                        decoration: BoxDecoration(
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                16,
                                                              ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Container(
                                                        width:
                                                            isTablet
                                                                ? 200
                                                                : 100,
                                                        height:
                                                            isTablet
                                                                ? 200
                                                                : 100,
                                                        decoration: BoxDecoration(
                                                          // color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                16,
                                                              ),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Child Name',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isTablet
                                                                        ? 30
                                                                        : 10,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                'John',
                                                                style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      isTablet
                                                                          ? 44
                                                                          : 22,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              'Date of Birth',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isTablet
                                                                        ? 30
                                                                        : 10,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '14-05-2012',
                                                                style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      isTablet
                                                                          ? 44
                                                                          : 22,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  Consumer<
                                                    EnrollStudentProvider
                                                  >(
                                                    builder: (
                                                      context,
                                                      enrollstdprovider,
                                                      _,
                                                    ) {
                                                      return InkWell(
                                                        onTap: () {
                                                          //for visible container
                                                          enrollstdprovider
                                                              .toggleVisibility(
                                                                index,
                                                              );
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                shape:
                                                                    BoxShape
                                                                        .circle,
                                                                border: Border.all(
                                                                  color: Color(
                                                                    0xFFEE742A,
                                                                  ),
                                                                  width:
                                                                      isTablet
                                                                          ? 4
                                                                          : 2,
                                                                ),
                                                              ),
                                                          child: CircleAvatar(
                                                            radius:
                                                                isTablet
                                                                    ? 40
                                                                    : 20,
                                                            backgroundColor:
                                                                const Color.fromARGB(
                                                                  87,
                                                                  255,
                                                                  255,
                                                                  255,
                                                                ),
                                                            child:
                                                                enrollstdprovider
                                                                            .visibleIndex ==
                                                                        index
                                                                    ? Icon(
                                                                      Icons
                                                                          .keyboard_arrow_up,
                                                                      color: Color(
                                                                        0xFFEE742A,
                                                                      ),
                                                                      size:
                                                                          isTablet
                                                                              ? 50
                                                                              : 25,
                                                                    )
                                                                    : Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down,
                                                                      color: Color(
                                                                        0xFFEE742A,
                                                                      ),
                                                                      size:
                                                                          isTablet
                                                                              ? 50
                                                                              : 25,
                                                                    ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              Consumer<EnrollStudentProvider>(
                                                builder: (
                                                  context,
                                                  enrollstudent,
                                                  _,
                                                ) {
                                                  return enrollstudent
                                                              .visibleIndex ==
                                                          index
                                                      ? Container(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ContainerTextWidgetsEnrollStudent(
                                                                  text1:
                                                                      'Parent s Name:',
                                                                  text2:
                                                                      'Jane Doe',
                                                                  isTablet:
                                                                      constraints
                                                                          .maxWidth >
                                                                      600,
                                                                ),
                                                                ContainerTextWidgetsEnrollStudent(
                                                                  text1:
                                                                      'Parent s Name:',
                                                                  text2:
                                                                      'Jane Doe',
                                                                  isTablet:
                                                                      constraints
                                                                          .maxWidth >
                                                                      600,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ContainerTextWidgetsEnrollStudent(
                                                                  text1:
                                                                      'Parent s Name:',
                                                                  text2:
                                                                      'Jane Doe',
                                                                  isTablet:
                                                                      constraints
                                                                          .maxWidth >
                                                                      600,
                                                                ),
                                                                ContainerTextWidgetsEnrollStudent(
                                                                  text1:
                                                                      'Parent s Name:',
                                                                  text2:
                                                                      'Jane Doe',
                                                                  isTablet:
                                                                      constraints
                                                                          .maxWidth >
                                                                      600,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ContainerTextWidgetsEnrollStudent(
                                                                  text1:
                                                                      'Parent s Name:',
                                                                  text2:
                                                                      'Jane Doe',
                                                                  isTablet:
                                                                      constraints
                                                                          .maxWidth >
                                                                      600,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                      : SizedBox.shrink();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  );
                                },
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
        floatingActionButton: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600; // tablet breakpoint

            return SizedBox(
              width: isTablet ? 300 : 170, // wider on tablet
              height: isTablet ? 100 : 50, // taller on tablet
              child: FloatingActionButton.extended(
                onPressed: () {
                  // action when clicked
                  Navigator.pushNamed(context, '/enrollnewstudentscreen');
                },
                backgroundColor: kButtonColor,
                icon: Icon(
                  Icons.add,
                  size: isTablet ? 50 : 24, // larger icon for tablet
                  color: kButtonTextColor,
                ),
                label: Text(
                  'Add Student',
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

class ContainerTextWidgetsEnrollStudent extends StatelessWidget {
  final String? text1;
  final String? text2;
  final bool isTablet;

  const ContainerTextWidgetsEnrollStudent({
    super.key,
    required this.text1,
    required this.text2,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$text1', style: TextStyle(fontSize: isTablet ? 30 : 14)),
            Text(
              '$text2',
              style: TextStyle(
                fontSize: isTablet ? 40 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnrolledStudentsShimmerLoading extends StatelessWidget {
  const EnrolledStudentsShimmerLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Padding(
        padding:
            isTablet
                ? const EdgeInsets.symmetric(horizontal: 40, vertical: 40)
                : const EdgeInsets.symmetric(horizontal: 20),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Header placeholder
              Container(
                height: isTablet ? 80 : 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: isTablet ? 40 : 20),
              // Search bar placeholder
              Container(
                height: isTablet ? 70 : 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(height: isTablet ? 40 : 20),
              // Loading list items
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: isTablet ? 300 : 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
