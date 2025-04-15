import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/manage_admission_provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class ManageAdmissionScreen extends StatefulWidget {
  const ManageAdmissionScreen({Key? key}) : super(key: key);

  @override
  _ManageAdmissionScreenState createState() => _ManageAdmissionScreenState();
}

class _ManageAdmissionScreenState extends State<ManageAdmissionScreen> {
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
            return Consumer<ManageAdmissionProvider>(
              builder: (context, managadmissionprovider, _) {
                return Stack(
                  children: [
                    Padding(
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
                              HeaderandBackwidget(text: 'Manage admissions'),
                              // SizedBox(height: isTablet ? 40 : 20),
                              // TextFormField(
                              //   decoration: InputDecoration(
                              //     prefixIcon: Icon(
                              //       Icons.search,
                              //       size:
                              //           MediaQuery.of(context).size.width > 600
                              //               ? 32
                              //               : 24,
                              //     ),
                              //     hintText: 'Search by student name',
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(30),
                              //       borderSide: BorderSide.none,
                              //     ),
                              //     hintStyle: TextStyle(
                              //       fontSize:
                              //           MediaQuery.of(context).size.width > 600
                              //               ? 18
                              //               : 14,
                              //     ),
                              //     contentPadding: EdgeInsets.symmetric(
                              //       horizontal:
                              //           MediaQuery.of(context).size.width > 600
                              //               ? 24
                              //               : 12,
                              //       vertical:
                              //           MediaQuery.of(context).size.width > 600
                              //               ? 20
                              //               : 12,
                              //     ),
                              //     filled: true,
                              //   ),
                              //   style: TextStyle(
                              //     fontSize:
                              //         MediaQuery.of(context).size.width > 600 ? 18 : 14,
                              //   ),
                              // ),
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
                                                    ManageAdmissionProvider
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
                                              Consumer<ManageAdmissionProvider>(
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
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await managadmissionprovider
                                                            .acceptadmissionFunction();

                                                        showDialog(
                                                          context: context,
                                                          barrierDismissible:
                                                              false,
                                                          builder: (context) {
                                                            // Auto close after 1 second
                                                            Future.delayed(
                                                              Duration(
                                                                seconds: 2,
                                                              ),
                                                              () {
                                                                Navigator.of(
                                                                  context,
                                                                ).pop();
                                                              },
                                                            );
                                                            return Dialog(
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      20,
                                                                    ),
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                      20,
                                                                    ),
                                                                height: 300,
                                                                width: 300,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: 60,
                                                                      height:
                                                                          60,
                                                                      decoration: BoxDecoration(
                                                                        image: DecorationImage(
                                                                          image: AssetImage(
                                                                            'assets/images/successmanagadmission.png',
                                                                          ),
                                                                          fit:
                                                                              BoxFit.cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Admission Rejected',
                                                                      style: TextStyle(
                                                                        color:
                                                                            kPrimaryTextColor,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Successfully',
                                                                      style: TextStyle(
                                                                        color:
                                                                            kPrimaryTextColor,
                                                                        fontSize:
                                                                            20,
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
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        Navigator.pop(
                                                                          context,
                                                                        );
                                                                      },
                                                                      child: Container(
                                                                        width:
                                                                            double.infinity,
                                                                        height:
                                                                            40,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            25,
                                                                          ),
                                                                          border:
                                                                              Border.all(),
                                                                        ),
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Ok',
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
                                                        height: 40,
                                                        width: 170,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                25,
                                                              ),
                                                          color:
                                                              const Color.fromARGB(
                                                                50,
                                                                244,
                                                                67,
                                                                54,
                                                              ),
                                                          border: Border.all(
                                                            color: Color(
                                                              0xFFCB1A20,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              child: Text(
                                                                'Reject',
                                                                style: TextStyle(
                                                                  color: Color(
                                                                    0xFFCB1A20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 5),
                                                            Center(
                                                              child: CircleAvatar(
                                                                radius:
                                                                    10, // you can adjust the size here
                                                                backgroundColor:
                                                                    Color(
                                                                      0xFFCB1A20,
                                                                    ),
                                                                child: Icon(
                                                                  Icons.close,
                                                                  color:
                                                                      Colors
                                                                          .white, // optional icon color
                                                                  size:
                                                                      10, // optional icon size
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),

                                                  /// accept
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await managadmissionprovider
                                                            .acceptadmissionFunction();

                                                        showDialog(
                                                          context: context,
                                                          barrierDismissible:
                                                              false,
                                                          builder: (context) {
                                                            // Auto close after 1 second
                                                            Future.delayed(
                                                              Duration(
                                                                seconds: 2,
                                                              ),
                                                              () {
                                                                Navigator.of(
                                                                  context,
                                                                ).pop();
                                                              },
                                                            );
                                                            return Dialog(
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      20,
                                                                    ),
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                      20,
                                                                    ),
                                                                height: 300,
                                                                width: 300,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: 60,
                                                                      height:
                                                                          60,
                                                                      decoration: BoxDecoration(
                                                                        image: DecorationImage(
                                                                          image: AssetImage(
                                                                            'assets/images/successmanagadmission.png',
                                                                          ),
                                                                          fit:
                                                                              BoxFit.cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Admission Accepted',
                                                                      style: TextStyle(
                                                                        color:
                                                                            kPrimaryTextColor,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Successfully',
                                                                      style: TextStyle(
                                                                        color:
                                                                            kPrimaryTextColor,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      'Now you can view this student in the Enrolled',
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Students list',
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        Navigator.pop(
                                                                          context,
                                                                        );
                                                                      },
                                                                      child: Container(
                                                                        width:
                                                                            double.infinity,
                                                                        height:
                                                                            40,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                            25,
                                                                          ),
                                                                          border:
                                                                              Border.all(),
                                                                        ),
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Ok',
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
                                                        height: 40,
                                                        width: 170,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                25,
                                                              ),
                                                          color: Color(
                                                            0xFFF1FDE7,
                                                          ),
                                                          border: Border.all(
                                                            color: Color(
                                                              0xFF4EA70B,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              child: Text(
                                                                'Accept',
                                                                style: TextStyle(
                                                                  color: Color(
                                                                    0xFF4EA70B,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 5),
                                                            Center(
                                                              child: CircleAvatar(
                                                                radius:
                                                                    10, // you can adjust the size here
                                                                backgroundColor:
                                                                    Color(
                                                                      0xFF4EA70B,
                                                                    ),
                                                                child: Icon(
                                                                  Icons.close,
                                                                  color:
                                                                      Colors
                                                                          .white, // optional icon color
                                                                  size:
                                                                      10, // optional icon size
                                                                ),
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
                    ),
                    // **Full-Screen Loader**
                    if (managadmissionprovider.isacceptLoading)
                      Container(
                        color: Colors.black.withOpacity(
                          0.3,
                        ), // Semi-transparent background
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                  ],
                );
              },
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
