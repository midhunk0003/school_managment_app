import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animaton;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..forward();

    _animaton = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    Future.delayed(Duration(seconds: 3), () {
      _navigatToLoginOrHome();
    });
    super.initState();
  }

  Future<void> _navigatToLoginOrHome() async {
    final sharedpref = await SharedPreferences.getInstance();
    final String? token = sharedpref.getString('username');
    final String? role = sharedpref.getString('role');
    print('aaaaaaaaaaaaaa : $token');
    print('role.................: $role');
    if (token == null || token.isEmpty) {
      print('navigate to login.................');
      Navigator.pushReplacementNamed(context, '/loginscreen');
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/bottomnavbarwidget',
        arguments: {'role': role},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: Color(0xFFFDF0E7))),
          Align(
            alignment: Alignment.center,
            child: FadeTransition(
              opacity: _animaton,
              child: SvgPicture.asset('assets/images/login/colorlogo.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
