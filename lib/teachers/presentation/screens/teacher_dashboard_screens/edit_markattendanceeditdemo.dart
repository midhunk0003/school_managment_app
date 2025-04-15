// import 'dart:developer';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:schoolmanagment/teachers/presentation/provider/mark_attendance_provider.dart';
// import 'package:schoolmanagment/widgets/headerandbackwidget.dart';
// import 'package:schoolmanagment/widgets/successdilogebox.dart';

// class MarkattendenceScreen extends StatefulWidget {
//   const MarkattendenceScreen({Key? key}) : super(key: key);

//   @override
//   _MarkattendenceScreenState createState() => _MarkattendenceScreenState();
// }

// class _MarkattendenceScreenState extends State<MarkattendenceScreen> {
//   final TextEditingController
//   selectDatefilterController = TextEditingController(
//     text:
//         "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
//   );
//   Future<void> _refreshData() async {
//     // Simulate a network call or any async operation to refresh data
//     await Future.delayed(Duration(seconds: 2));
//     setState(() {
//       // Update your state here to refresh the UI
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             bool isTablet = constraints.maxWidth > 600;
//             return Consumer<MarkAttendanceProvider>(
//               builder: (context, studentattendancemarkprovider, _) {
//                 return Stack(
//                   children: [
//                     Padding(
//                       padding:
//                           isTablet
//                               ? const EdgeInsets.symmetric(
//                                 horizontal: 50,
//                                 vertical: 50,
//                               )
//                               : const EdgeInsets.symmetric(horizontal: 20),
//                       child: RefreshIndicator(
//                         onRefresh: _refreshData,
//                         child: SingleChildScrollView(
//                           physics: AlwaysScrollableScrollPhysics(),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             // mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               SizedBox(height: isTablet ? 40 : 20),
//                               HeaderandBackwidget(text: 'Mark Attendance'),
//                               SizedBox(height: isTablet ? 80 : 40),
//                               Container(
//                                 width: isTablet ? 340 : 170,
//                                 height: isTablet ? 80 : 40,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xFFF9F9F9),
//                                 ),
//                                 child: TextField(
//                                   controller: selectDatefilterController,
//                                   decoration: InputDecoration(
//                                     hintText: 'select data filter',
//                                     suffixIcon: Icon(
//                                       Icons.keyboard_arrow_down_outlined,
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(16),
//                                     ),
//                                     contentPadding: EdgeInsets.symmetric(
//                                       horizontal: 10,
//                                       vertical: 10,
//                                     ),
//                                   ),
//                                   readOnly: true,

//                                   onTap: () async {
//                                     final DateTime? picked =
//                                         await showDatePicker(
//                                           context: context,
//                                           initialDate: DateTime.now(),
//                                           firstDate: DateTime(2000),
//                                           lastDate: DateTime.now(),
//                                         );
//                                     if (picked != null) {
//                                       selectDatefilterController.text =
//                                           "${picked.day}/${picked.month}/${picked.year}";
//                                       // studentattendancemarkprovider
//                                       //     .filterByDate(picked);
//                                     }

//                                     log(
//                                       '............. ${selectDatefilterController.text}',
//                                     );
//                                   },
//                                 ),
//                               ),
//                               SizedBox(height: isTablet ? 40 : 20),
//                               Column(
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFEEEFF7),
//                                       borderRadius: BorderRadius.circular(16),
//                                       // border: Border.all()
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(20),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Container(
//                                                 height: isTablet ? 100 : 50,
//                                                 width: isTablet ? 100 : 50,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(12),
//                                                   color: Color(0xFF4A599B),
//                                                 ),

//                                                 child: ClipRect(
//                                                   child: Image.asset(
//                                                     'assets/images/teacher/markattendanceicon.png',
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: isTablet ? 20 : 10,
//                                               ),

//                                               Consumer<MarkAttendanceProvider>(
//                                                 builder: (
//                                                   context,
//                                                   percentMarkAttendProvider,
//                                                   _,
//                                                 ) {
//                                                   return Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Text(
//                                                         'Today’s Attendance',
//                                                       ),
//                                                       Text(
//                                                         '${percentMarkAttendProvider.percentage.toString()}%',
//                                                         style: TextStyle(
//                                                           fontSize:
//                                                               isTablet
//                                                                   ? 40
//                                                                   : 20,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   );
//                                                 },
//                                               ),
//                                             ],
//                                           ),

//                                           SizedBox(height: isTablet ? 20 : 10),

//                                           Consumer<MarkAttendanceProvider>(
//                                             builder: (
//                                               context,
//                                               markAttendanceProvider,
//                                               _,
//                                             ) {
//                                               return Row(
//                                                 children: [
//                                                   attendenceCardWidget(
//                                                     isTablet: isTablet,
//                                                     title: 'Total',
//                                                     value:
//                                                         '${markAttendanceProvider.totalStudents.toString()}',
//                                                   ),
//                                                   SizedBox(
//                                                     width: isTablet ? 20 : 10,
//                                                   ),
//                                                   attendenceCardWidget(
//                                                     isTablet: isTablet,
//                                                     title: 'Present',
//                                                     value:
//                                                         '${markAttendanceProvider.presentCount.toString()}',
//                                                   ),
//                                                   SizedBox(
//                                                     width: isTablet ? 20 : 10,
//                                                   ),
//                                                   attendenceCardWidget(
//                                                     isTablet: isTablet,
//                                                     title: 'Absent',
//                                                     value:
//                                                         '${markAttendanceProvider.absentCount.toString()}',
//                                                   ),
//                                                 ],
//                                               );
//                                             },
//                                           ),
//                                           SizedBox(height: isTablet ? 20 : 10),

//                                           // Text('Today Marked: 3/40'),
//                                           // SizedBox(height: isTablet ? 20 : 10),
//                                           // // Progress Bar
//                                           // LinearProgressIndicator(
//                                           //   value:
//                                           //       3 / 40, // 0.25 (25% progress),
//                                           //   backgroundColor:
//                                           //       const Color.fromARGB(
//                                           //         255,
//                                           //         187,
//                                           //         184,
//                                           //         184,
//                                           //       ),
//                                           //   color: Color(0xFF4A599B),
//                                           //   minHeight: isTablet ? 10 : 5,
//                                           // ),
//                                           SizedBox(height: isTablet ? 40 : 20),

//                                           Container(
//                                             height: isTablet ? 80 : 40,
//                                             decoration: BoxDecoration(
//                                               color: Colors.black,
//                                               borderRadius:
//                                                   BorderRadius.circular(25),
//                                               border: Border.all(
//                                                 color: const Color.fromARGB(
//                                                   255,
//                                                   190,
//                                                   189,
//                                                   189,
//                                                 ),
//                                               ),
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 'Submit to Management',
//                                                 style: TextStyle(
//                                                   fontSize: isTablet ? 24 : 12,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           // SizedBox(height: isTablet ? 20 : 10),
//                                           // Text(
//                                           //   'Button disabled until all students are marked',
//                                           //   style: TextStyle(
//                                           //     fontSize: isTablet ? 24 : 12,
//                                           //     fontWeight: FontWeight.bold,
//                                           //   ),
//                                           // ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),

//                                   SizedBox(height: isTablet ? 60 : 30),

//                                   ListView.separated(
//                                     shrinkWrap: true,
//                                     physics: NeverScrollableScrollPhysics(),
//                                     itemCount:
//                                         studentattendancemarkprovider
//                                             .studentAttendance
//                                             .length,
//                                     itemBuilder: (context, index) {
//                                       final student =
//                                           studentattendancemarkprovider
//                                               .studentAttendance[index];
//                                       return Container(
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF9F9F9),
//                                           borderRadius: BorderRadius.circular(
//                                             16,
//                                           ),
//                                           border: Border.all(
//                                             color: Colors.grey,
//                                           ),
//                                         ),

//                                         child: Padding(
//                                           padding:
//                                               isTablet
//                                                   ? const EdgeInsets.all(40)
//                                                   : const EdgeInsets.all(20),
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Container(
//                                                         height:
//                                                             isTablet ? 100 : 50,
//                                                         width:
//                                                             isTablet ? 100 : 50,
//                                                         decoration: BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius.circular(
//                                                                 8,
//                                                               ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         width:
//                                                             isTablet ? 20 : 10,
//                                                       ),
//                                                       Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             '${student.name}',
//                                                             style: TextStyle(
//                                                               fontSize:
//                                                                   isTablet
//                                                                       ? 40
//                                                                       : 20,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                             ),
//                                                           ),
//                                                           Text(
//                                                             'ID : 234567 | Class  : ${student.className}',
//                                                             style: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400,
//                                                               color: Color(
//                                                                 0xFF606060,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),

//                                               // SizedBox(
//                                               //   height: isTablet ? 40 : 20,
//                                               // ),

//                                               // student.status.toLowerCase() ==
//                                               //         'not marked'
//                                               //     ? Row(
//                                               //       children: [
//                                               //         Text("STATUS : "),
//                                               //         Text("NOT MARKED"),
//                                               //       ],
//                                               //     )
//                                               //     : student.status
//                                               //             .toLowerCase() ==
//                                               //         'present'
//                                               //     ? Row(
//                                               //       children: [
//                                               //         Text("STATUS : "),
//                                               //         Text(
//                                               //           "Present",
//                                               //           style: TextStyle(
//                                               //             color: Colors.black,
//                                               //             fontWeight:
//                                               //                 FontWeight.bold,
//                                               //             fontSize:
//                                               //                 isTablet
//                                               //                     ? 30
//                                               //                     : 15,
//                                               //           ),
//                                               //         ),
//                                               //       ],
//                                               //     )
//                                               //     : Row(
//                                               //       children: [
//                                               //         Text("STATUS : "),
//                                               //         Text(
//                                               //           " Absent",
//                                               //           style: TextStyle(
//                                               //             color: Colors.black,
//                                               //             fontWeight:
//                                               //                 FontWeight.bold,
//                                               //             fontSize:
//                                               //                 isTablet
//                                               //                     ? 30
//                                               //                     : 15,
//                                               //           ),
//                                               //         ),
//                                               //       ],
//                                               //     ),

//                                               // SizedBox(
//                                               //   height: isTablet ? 40 : 20,
//                                               // ),
//                                               student.status.toLowerCase() ==
//                                                       'not marked'
//                                                   ? Row(
//                                                     children: [
//                                                       Expanded(
//                                                         child: InkWell(
//                                                           onTap: () async {
//                                                             print('absent');
//                                                             await studentattendancemarkprovider
//                                                                 .markAttendance(
//                                                                   index,
//                                                                   'absent',
//                                                                 );
//                                                             // successDialogBox(
//                                                             //   context,
//                                                             //   'Student marked NOT PRESENT successfully!',
//                                                             //   '${student.name}',
//                                                             // );
//                                                           },
//                                                           child: Container(
//                                                             height:
//                                                                 isTablet
//                                                                     ? 80
//                                                                     : 40,
//                                                             // width: isTablet ? 340 : 170,
//                                                             decoration: BoxDecoration(
//                                                               color: Color(
//                                                                 0xFFFCE8E9,
//                                                               ),
//                                                               borderRadius:
//                                                                   BorderRadius.circular(
//                                                                     25,
//                                                                   ),
//                                                               border: Border.all(
//                                                                 color:
//                                                                     Colors.red,
//                                                               ),
//                                                             ),
//                                                             child: Padding(
//                                                               padding:
//                                                                   const EdgeInsets.all(
//                                                                     8.0,
//                                                                   ),
//                                                               child: Row(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .center,
//                                                                 children: [
//                                                                   Text(
//                                                                     'Absent',
//                                                                     style: TextStyle(
//                                                                       color:
//                                                                           Colors
//                                                                               .red,
//                                                                       fontSize:
//                                                                           isTablet
//                                                                               ? 30
//                                                                               : 15,
//                                                                     ),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width:
//                                                                         isTablet
//                                                                             ? 10
//                                                                             : 5,
//                                                                   ),
//                                                                   Container(
//                                                                     width:
//                                                                         20, // adjust size as needed
//                                                                     height: 20,
//                                                                     decoration: BoxDecoration(
//                                                                       shape:
//                                                                           BoxShape
//                                                                               .circle,
//                                                                       border: Border.all(
//                                                                         color:
//                                                                             Colors.red, // border color
//                                                                         width:
//                                                                             2, // border width
//                                                                       ),
//                                                                     ),
//                                                                     child: Center(
//                                                                       child: Icon(
//                                                                         Icons
//                                                                             .close,
//                                                                         size:
//                                                                             14,
//                                                                         color:
//                                                                             Colors.red,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         width:
//                                                             isTablet ? 20 : 10,
//                                                       ),
//                                                       Expanded(
//                                                         child: InkWell(
//                                                           onTap: () async {
//                                                             print('present');
//                                                             await studentattendancemarkprovider
//                                                                 .markAttendance(
//                                                                   index,
//                                                                   'present',
//                                                                 );
//                                                             // successDialogBox(
//                                                             //   context,
//                                                             //   'Student marked Present successfully!',
//                                                             //   '${student.name}',
//                                                             // );
//                                                           },
//                                                           child: Container(
//                                                             height:
//                                                                 isTablet
//                                                                     ? 80
//                                                                     : 40,
//                                                             // width: isTablet ? 340 : 170,
//                                                             decoration: BoxDecoration(
//                                                               color: Color(
//                                                                 0xFFF1FDE7,
//                                                               ),
//                                                               borderRadius:
//                                                                   BorderRadius.circular(
//                                                                     25,
//                                                                   ),
//                                                               border: Border.all(
//                                                                 color:
//                                                                     Colors
//                                                                         .green,
//                                                               ),
//                                                             ),
//                                                             child: Padding(
//                                                               padding:
//                                                                   const EdgeInsets.all(
//                                                                     8.0,
//                                                                   ),
//                                                               child: Row(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .center,
//                                                                 children: [
//                                                                   Text(
//                                                                     'Present',
//                                                                     style: TextStyle(
//                                                                       color:
//                                                                           Colors
//                                                                               .green,
//                                                                       fontSize:
//                                                                           isTablet
//                                                                               ? 30
//                                                                               : 15,
//                                                                     ),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width:
//                                                                         isTablet
//                                                                             ? 10
//                                                                             : 5,
//                                                                   ),
//                                                                   Container(
//                                                                     width:
//                                                                         20, // adjust size as needed
//                                                                     height: 20,
//                                                                     decoration: BoxDecoration(
//                                                                       shape:
//                                                                           BoxShape
//                                                                               .circle,
//                                                                       border: Border.all(
//                                                                         color:
//                                                                             Colors.green, // border color
//                                                                         width:
//                                                                             2, // border width
//                                                                       ),
//                                                                     ),
//                                                                     child: Center(
//                                                                       child: Icon(
//                                                                         Icons
//                                                                             .check,
//                                                                         size:
//                                                                             14,
//                                                                         color:
//                                                                             Colors.green,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   )
//                                                   : student.status
//                                                           .toLowerCase() ==
//                                                       'absent'
//                                                   ? InkWell(
//                                                     onTap: () async {
//                                                       print('absent');
//                                                       await studentattendancemarkprovider
//                                                           .markAttendance(
//                                                             index,
//                                                             'absent',
//                                                           );
//                                                       // successDialogBox(
//                                                       //   context,
//                                                       //   'Student marked NOT PRESENT successfully!',
//                                                       //   '${student.name}',
//                                                       // );
//                                                     },
//                                                     child: Container(
//                                                       height:
//                                                           isTablet ? 80 : 40,
//                                                       // width: isTablet ? 340 : 170,
//                                                       decoration: BoxDecoration(
//                                                         color: Color(
//                                                           0xFFFCE8E9,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius.circular(
//                                                               25,
//                                                             ),
//                                                         border: Border.all(
//                                                           color: Colors.red,
//                                                         ),
//                                                       ),
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets.all(
//                                                               8.0,
//                                                             ),
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             Text(
//                                                               'make student Absent',
//                                                               style: TextStyle(
//                                                                 color:
//                                                                     Colors.red,
//                                                                 fontSize:
//                                                                     isTablet
//                                                                         ? 30
//                                                                         : 15,
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               width:
//                                                                   isTablet
//                                                                       ? 10
//                                                                       : 5,
//                                                             ),
//                                                             Container(
//                                                               width:
//                                                                   20, // adjust size as needed
//                                                               height: 20,
//                                                               decoration: BoxDecoration(
//                                                                 shape:
//                                                                     BoxShape
//                                                                         .circle,
//                                                                 border: Border.all(
//                                                                   color:
//                                                                       Colors
//                                                                           .red, // border color
//                                                                   width:
//                                                                       2, // border width
//                                                                 ),
//                                                               ),
//                                                               child: Center(
//                                                                 child: Icon(
//                                                                   Icons.close,
//                                                                   size: 14,
//                                                                   color:
//                                                                       Colors
//                                                                           .red,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   )
//                                                   : InkWell(
//                                                     onTap: () async {
//                                                       print('present');
//                                                       await studentattendancemarkprovider
//                                                           .markAttendance(
//                                                             index,
//                                                             'present',
//                                                           );
//                                                       // successDialogBox(
//                                                       //   context,
//                                                       //   'Student marked Present successfully!',
//                                                       //   '${student.name}',
//                                                       // );
//                                                     },
//                                                     child: Container(
//                                                       height:
//                                                           isTablet ? 80 : 40,
//                                                       // width: isTablet ? 340 : 170,
//                                                       decoration: BoxDecoration(
//                                                         color: Color(
//                                                           0xFFF1FDE7,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius.circular(
//                                                               25,
//                                                             ),
//                                                         border: Border.all(
//                                                           color: Colors.green,
//                                                         ),
//                                                       ),
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets.all(
//                                                               8.0,
//                                                             ),
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             Text(
//                                                               'make student Present',
//                                                               style: TextStyle(
//                                                                 color:
//                                                                     Colors
//                                                                         .green,
//                                                                 fontSize:
//                                                                     isTablet
//                                                                         ? 30
//                                                                         : 15,
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               width:
//                                                                   isTablet
//                                                                       ? 10
//                                                                       : 5,
//                                                             ),
//                                                             Container(
//                                                               width:
//                                                                   20, // adjust size as needed
//                                                               height: 20,
//                                                               decoration: BoxDecoration(
//                                                                 shape:
//                                                                     BoxShape
//                                                                         .circle,
//                                                                 border: Border.all(
//                                                                   color:
//                                                                       Colors
//                                                                           .green, // border color
//                                                                   width:
//                                                                       2, // border width
//                                                                 ),
//                                                               ),
//                                                               child: Center(
//                                                                 child: Icon(
//                                                                   Icons.check,
//                                                                   size: 14,
//                                                                   color:
//                                                                       Colors
//                                                                           .green,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                               // : student.status
//                                               //         .toLowerCase() ==
//                                               //     'present'
//                                               // ? Row(
//                                               //   children: [
//                                               //     Container(
//                                               //       width:
//                                               //           20, // adjust size as needed
//                                               //       height: 20,
//                                               //       decoration: BoxDecoration(
//                                               //         shape:
//                                               //             BoxShape.circle,
//                                               //         border: Border.all(
//                                               //           color:
//                                               //               Colors
//                                               //                   .green, // border color
//                                               //           width:
//                                               //               2, // border width
//                                               //         ),
//                                               //       ),
//                                               //       child: Center(
//                                               //         child: Icon(
//                                               //           Icons.check,
//                                               //           size: 14,
//                                               //           color: Colors.green,
//                                               //         ),
//                                               //       ),
//                                               //     ),
//                                               //     SizedBox(
//                                               //       width:
//                                               //           isTablet ? 10 : 5,
//                                               //     ),
//                                               //     Text(
//                                               //       '${student.name} marked present today',
//                                               //     ),
//                                               //   ],
//                                               // )
//                                               // : Row(
//                                               //   children: [
//                                               //     Container(
//                                               //       width:
//                                               //           20, // adjust size as needed
//                                               //       height: 20,
//                                               //       decoration: BoxDecoration(
//                                               //         shape:
//                                               //             BoxShape.circle,
//                                               //         border: Border.all(
//                                               //           color:
//                                               //               Colors
//                                               //                   .red, // border color
//                                               //           width:
//                                               //               2, // border width
//                                               //         ),
//                                               //       ),
//                                               //       child: Center(
//                                               //         child: Icon(
//                                               //           Icons.close,
//                                               //           size: 14,
//                                               //           color: Colors.red,
//                                               //         ),
//                                               //       ),
//                                               //     ),
//                                               //     SizedBox(
//                                               //       width:
//                                               //           isTablet ? 10 : 5,
//                                               //     ),
//                                               //     Text(
//                                               //       '${student.name} marked Not present today',
//                                               //     ),
//                                               //   ],
//                                               // ),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     separatorBuilder: (context, index) {
//                                       return SizedBox(
//                                         height: isTablet ? 20 : 10,
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     // **Full-Screen Loader**
//                     if (studentattendancemarkprovider.isLoading)
//                       Container(
//                         color: Colors.black.withOpacity(
//                           0.3,
//                         ), // Semi-transparent background
//                         child: Center(
//                           child: CircularProgressIndicator(color: Colors.white),
//                         ),
//                       ),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class attendenceCardWidget extends StatelessWidget {
//   final String? title;
//   final String? value;
//   const attendenceCardWidget({
//     super.key,
//     required this.isTablet,
//     required this.title,
//     required this.value,
//   });

//   final bool isTablet;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Color(0xFF4A599B)),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Text('$title', style: TextStyle(fontSize: isTablet ? 24 : 12)),
//               SizedBox(height: isTablet ? 20 : 10),
//               Text(
//                 '$value',
//                 style: TextStyle(
//                   fontSize: isTablet ? 40 : 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
