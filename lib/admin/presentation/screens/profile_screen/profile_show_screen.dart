import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';
import 'package:schoolmanagment/widgets/login_provider.dart';

class ProfileShowScreen extends StatefulWidget {
  const ProfileShowScreen({Key? key}) : super(key: key);

  @override
  _ProfileShowScreenState createState() => _ProfileShowScreenState();
}

class _ProfileShowScreenState extends State<ProfileShowScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<LoginProvider>(
          builder: (context, loginProvider, _) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isTablet = constraints.maxWidth > 600;

                    return Padding(
                      padding:
                          isTablet
                              ? const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 50,
                              )
                              : const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: isTablet ? 40 : 20),
                          HeaderandBackwidget(text: 'Profile'),
                          SizedBox(height: isTablet ? 80 : 40),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding:
                                  isTablet
                                      ? const EdgeInsets.all(40)
                                      : const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Personal Information',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/profileeditscreen',
                                          );
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xFFEE742A),
                                          child: Icon(
                                            Icons.edit_note,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: isTablet ? 20 : 10),
                                  Divider(),
                                  SizedBox(height: isTablet ? 20 : 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                        ),
                                      ),
                                      Text(
                                        'John Cena',
                                        style: TextStyle(
                                          fontSize: isTablet ? 50 : 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: isTablet ? 20 : 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'User role',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                        ),
                                      ),
                                      Text(
                                        'Admin',
                                        style: TextStyle(
                                          fontSize: isTablet ? 50 : 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: isTablet ? 20 : 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                        ),
                                      ),
                                      Text(
                                        'john.admin@example.com',
                                        style: TextStyle(
                                          fontSize: isTablet ? 50 : 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: isTablet ? 20 : 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Phone',
                                        style: TextStyle(
                                          fontSize: isTablet ? 32 : 16,
                                        ),
                                      ),
                                      Text(
                                        '(555) 123-4567',
                                        style: TextStyle(
                                          fontSize: isTablet ? 50 : 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                // **Full-Screen Loader**
                if (loginProvider.isLogingLoading)
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
        ),
      ),
    );
  }
}
