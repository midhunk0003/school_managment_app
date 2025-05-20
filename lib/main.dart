import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/adminhome_provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/calender_provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/enroll_student_provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/manage_admission_provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/notification_provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/report_over_view_provider.dart';
import 'package:schoolmanagment/admin/presentation/provider/student_manage_id_provider.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/admindashboard_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/create_student_id_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/enroll_new_student_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/enrolledstudent_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/manage_admission_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/manage_student_id_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/report_over_view_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/student_id_details_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/view_billing_payment_detail_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/admindashboard_screen/view_billing_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/calender_screen/create_event.dart';
import 'package:schoolmanagment/admin/presentation/screens/message_screen/message_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/notification_screen.dart/create_notification.dart';
import 'package:schoolmanagment/admin/presentation/screens/notification_screen.dart/notifications_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/profile_screen/profile_edit_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/profile_screen/profile_screen.dart';
import 'package:schoolmanagment/admin/presentation/screens/profile_screen/profile_show_screen.dart';
import 'package:schoolmanagment/parents/presentation/provider/p_calender_provider.dart';
import 'package:schoolmanagment/parents/presentation/provider/payment_provider.dart';
import 'package:schoolmanagment/parents/presentation/screens/notification_screen/p_notification_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/child_profile_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/fees_payment_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/p_assignment_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/p_field_trip_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/p_gallery_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/p_gallery_sub_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/parent_dashboard_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/parent_dashboard_screens/payment_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/profile_screen/p_profile_screen.dart';
import 'package:schoolmanagment/parents/presentation/screens/profile_screen/p_profile_show_screen.dart';
import 'package:schoolmanagment/teachers/presentation/provider/mark_attendance_provider.dart';
import 'package:schoolmanagment/teachers/presentation/provider/teacher_calender_provider.dart';
import 'package:schoolmanagment/teachers/presentation/provider/teacherdashboard_provider.dart';
import 'package:schoolmanagment/teachers/presentation/screens/calender_screen/teacher_calender_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/message_screen/t_chat_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/notification_screen/t_notification_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/profile_screen/t_profile_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/profile_screen/t_profile_show_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/assignment_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/create_assignment_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/daily_update_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/field_trip_form_create.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/field_trip_forms_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/gallery_create_album_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/gallery_edit_album_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/gallery_photos_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/gallery_screen.dart';
import 'package:schoolmanagment/teachers/presentation/screens/teacher_dashboard_screens/markattendence_screen.dart';
import 'package:schoolmanagment/widgets/bottomnavbar_provider.dart';
import 'package:schoolmanagment/widgets/bottomnavbar_widget.dart';
import 'package:schoolmanagment/widgets/login_provider.dart';
import 'package:schoolmanagment/widgets/login_screen.dart';
import 'package:schoolmanagment/widgets/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.remove('role');
  // await prefs.remove('username');
  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     builder: (context) {
  //       return const MyApp();
  //     },
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => BottomnavbarProvider()),
        ChangeNotifierProvider(create: (_) => AdminhomeProvider()),
        ChangeNotifierProvider(create: (_) => EnrollStudentProvider()),
        ChangeNotifierProvider(create: (_) => ManageAdmissionProvider()),
        ChangeNotifierProvider(create: (_) => StudentManageIdProvider()),
        ChangeNotifierProvider(create: (_) => ReportOverViewProvider()),
        ChangeNotifierProvider(create: (_) => CalenderProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        // teacher section start
        ChangeNotifierProvider(create: (_) => TeacherdashboardProvider()),
        ChangeNotifierProvider(create: (_) => MarkAttendanceProvider()),
        ChangeNotifierProvider(create: (_) => TeacherCalenderProvider()),

        // parent section
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => PCalenderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'School Managment',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return _customPageRoute(SplashScreen());
            case '/loginscreen':
              return _customPageRoute(LoginScreen());
            case '/bottomnavbarwidget':
              final args = settings.arguments as Map<String, dynamic>?;
              final String? role = args?['role'] ?? 'default';
              print('............ $role');
              return _customPageRoute(BottomnavbarWidget(userRole: role));
            case '/adminDashboard':
              return _customPageRoute(AdmindashboardScreen());
            case '/teacherdashboardscreen':
              return _customPageRoute(AdmindashboardScreen());
            case '/parentdashboardscreen':
              return _customPageRoute(AdmindashboardScreen());
            case '/enrolledstudentscreen':
              return _customPageRoute(EnrolledstudentScreen());
            case '/enrollnewstudentscreen':
              return _customPageRoute(EnrollNewStudentScreen());
            case '/manageAdmissionScreen':
              return _customPageRoute(ManageAdmissionScreen());
            case '/viewbillingscreen':
              return _customPageRoute(ViewBillingScreen());
            case '/viewbillingpaymentdetailscreen':
              return _customPageRoute(ViewBillingPaymentDetailScreen());
            case '/managestudentidscreen':
              return _customPageRoute(ManageStudentIdScreen());
            case '/studentiddetailsscreen':
              return _customPageRoute(StudentIdDetailsScreen());
            case '/createstudentidscreen':
              return _customPageRoute(CreateStudentIdScreen());
            case '/reportoverviewscreen':
              return _customPageRoute(ReportOverViewScreen());
            case '/createevents':
              return _customPageRoute(CreateEvent());
            case '/notificationsscreen':
              return _customPageRoute(NotificationsScreen());
            case '/createnotification':
              return _customPageRoute(CreateNotification());
            case '/profilescreen':
              return _customPageRoute(ProfileScreen());
            case '/profileshowscreen':
              return _customPageRoute(ProfileShowScreen());
            case '/profileeditscreen':
              return _customPageRoute(ProfileEditScreen());

            // teachers section start
            case '/markattendencescreen':
              return _customPageRoute(MarkattendenceScreen());
            case '/dailyupdatescreen':
              return _customPageRoute(DailyUpdateScreen());
            case '/assignmentscreen':
              return _customPageRoute(AssignmentScreen());
            case '/createassignmentscreen':
              return _customPageRoute(CreateAssignmentScreen());
            case '/galleryscreen':
              return _customPageRoute(GalleryScreen());
            case '/gallerycreatealbumscreen':
              return _customPageRoute(GalleryCreateAlbumScreen());
            case '/galleryphotosscreen':
              return _customPageRoute(GalleryPhotosScreen());
            case '/galleryeditalbumscreen':
              return _customPageRoute(GalleryEditAlbumScreen());
            case '/fieldtripformsscreen':
              return _customPageRoute(FieldTripFormsScreen());
            case '/fieldtripformcreate':
              return _customPageRoute(FieldTripFormCreate());
            case '/teachercalenderscreen':
              return _customPageRoute(TeacherCalenderScreen());
            case '/tNotificationscreen':
              return _customPageRoute(TNotificationScreen());
            case '/tProfilescreen':
              return _customPageRoute(TProfileScreen());
            case '/tprofileshowscreen':
              return _customPageRoute(TProfileShowScreen());
            case '/tchatscreen':
              return _customPageRoute(TChatScreen());

            // parent start section
            case '/parentdashboardscreens':
              return _customPageRoute(ParentDashboardScreen());
            case '/childprofilescreen':
              return _customPageRoute(ChildProfileScreen());
            case '/feespaymentscreen':
              return _customPageRoute(FeesPaymentScreen());
            case '/paymentscreen':
              return _customPageRoute(PaymentScreen());
            case '/passignmentscreen':
              return _customPageRoute(PAssignmentScreen());
            case '/pgalleryscreen':
              return _customPageRoute(PGalleryScreen());
            case '/pgallerysubscreen':
              return _customPageRoute(PGallerySubScreen());
            case '/pfieldtripscreen':
              return _customPageRoute(PFieldTripScreen());
            case '/pnotificationscreen':
              return _customPageRoute(PNotificationScreen());
            case '/pprofilescreen':
              return _customPageRoute(PProfileScreen());
            case '/pprofileshowscreen':
              return _customPageRoute(PProfileShowScreen());
            default:
              return null;
          }
        },
      ),
    );
  }
}

// Helper function to create custom page transitions
PageRouteBuilder _customPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Slide from right
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(opacity: animation, child: child),
      );
    },
    transitionDuration: Duration(milliseconds: 500), // Animation duration
  );
}
