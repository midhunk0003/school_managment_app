import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/widgets/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF0E7),
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, _) {
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isTablet = constraints.maxWidth > 600;

                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                          isTablet
                              ? const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 50,
                              )
                              : const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: isTablet ? 100 : 50),
                            Container(
                              // color: Colors.amber,
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: isTablet ? 50 : 25,
                                        backgroundColor: Color(0xFFEE742A),
                                        child: SvgPicture.asset(
                                          width: isTablet ? 60 : 30,
                                          height: isTablet ? 60 : 30,
                                          'assets/images/login/whitelogo.svg',
                                        ),
                                      ),
                                      Text(
                                        'Future Generation',
                                        style: TextStyle(
                                          fontSize: isTablet ? 48 : 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Group of Schools',
                                        style: TextStyle(
                                          fontSize: isTablet ? 28 : 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: isTablet ? 24 : 12),

                            Container(
                              height: isTablet ? 510 : 253,
                              width: double.infinity,
                              // color: Colors.amber,
                              child: Center(
                                child: SvgPicture.asset(
                                  height: isTablet ? 510 : 253,
                                  width: double.infinity,
                                  'assets/images/login/Frame.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: isTablet ? 70 : 35),

                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFEE742A),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isTablet ? 40 : 20,
                                  vertical: isTablet ? 80 : 40,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isTablet ? 48 : 24,
                                      ),
                                    ),
                                    SizedBox(height: isTablet ? 48 : 24),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'User Name ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isTablet ? 28 : 14,
                                          ),
                                        ),
                                        // SizedBox(height: isTablet ? 24 : 12),
                                        TextFormField(
                                          controller: usernameController,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Username',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter username";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    // SizedBox(height: isTablet ? 40 : 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'User Name ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isTablet ? 28 : 14,
                                          ),
                                        ),
                                        SizedBox(height: isTablet ? 24 : 12),
                                        TextFormField(
                                          controller: passwordController,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.visibility_off,
                                            ),
                                            hintText: 'Enter Password',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter password";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: isTablet ? 40 : 20),
                                    // SizedBox(height: isTablet ? 60 : 30),
                                    InkWell(
                                      onTap: () async {
                                        if (_formKey.currentState!.validate()) {
                                          print('validate success');
                                          // print(selectLogingroup);
                                          print(usernameController.text);
                                          print(passwordController.text);
                                          await loginProvider.loginFunction(
                                            context,
                                            // selectLogingroup,
                                            usernameController.text,
                                            passwordController.text,
                                          );
                                        }
                                      },
                                      child: Container(
                                        height: isTablet ? 100 : 50,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              isTablet
                                                  ? BorderRadius.circular(50)
                                                  : BorderRadius.circular(25),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: isTablet ? 28 : 14,
                                            ),
                                          ),
                                        ),
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
                  );
                },
              ),
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
    );
  }
}
