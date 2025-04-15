import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';
import 'package:schoolmanagment/widgets/login_provider.dart';

class PProfileScreen extends StatefulWidget {
  const PProfileScreen({Key? key}) : super(key: key);

  @override
  _PProfileScreenState createState() => _PProfileScreenState();
}

class _PProfileScreenState extends State<PProfileScreen> {
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
                            // decoration: BoxDecoration(color: Colors.amber),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: isTablet ? 120 : 60,
                                      foregroundImage: AssetImage(
                                        'assets/images/profile.jpeg',
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius:
                                            isTablet
                                                ? 36
                                                : 18, // Adjust size as needed
                                        backgroundColor: Color(0xFFEE742A),
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: isTablet ? 36 : 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: isTablet ? 24 : 12),
                                Text(
                                  'John Cena',
                                  style: TextStyle(
                                    fontSize: isTablet ? 48 : 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: isTablet ? 12 : 6),
                                Text(
                                  'Admin',
                                  style: TextStyle(
                                    fontSize: isTablet ? 36 : 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/pprofileshowscreen',
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person_2_outlined,
                                              size: isTablet ? 60 : 30,
                                            ),
                                            SizedBox(width: isTablet ? 20 : 10),
                                            Text(
                                              'Personal Information',
                                              style: TextStyle(
                                                fontSize: isTablet ? 32 : 16,
                                              ),
                                            ),
                                          ],
                                        ),

                                        Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: isTablet ? 20 : 10),
                                  Divider(),
                                  SizedBox(height: isTablet ? 20 : 10),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.notifications_outlined,
                                            size: isTablet ? 60 : 30,
                                          ),
                                          SizedBox(width: isTablet ? 20 : 10),
                                          Text(
                                            'Notification Preferences',
                                            style: TextStyle(
                                              fontSize: isTablet ? 32 : 16,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Switch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                          });
                                        },
                                        activeColor: Color(0xFFEE742A),
                                        inactiveThumbColor: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: isTablet ? 60 : 30),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    title: Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: Text(
                                      "Are you sure you want to logout?",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(
                                            context,
                                          ).pop(); // Close the dialog
                                        },
                                        child: Text(
                                          "No",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                        onPressed: () async {
                                          await loginProvider.logout();
                                          Navigator.of(context).pop();
                                          Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/loginscreen',
                                            (route) => false,
                                          );

                                          // Close the dialog

                                          // Perform logout action here
                                        },
                                        child: Text("Yes"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
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
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.logout_outlined,
                                      color: Color(0xFFCB1A20),
                                      size: isTablet ? 60 : 30,
                                    ),
                                    SizedBox(width: isTablet ? 20 : 10),
                                    Text(
                                      'Log out',
                                      style: TextStyle(
                                        fontSize: isTablet ? 32 : 16,
                                        color: Color(0xFFCB1A20),
                                      ),
                                    ),
                                  ],
                                ),
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
