import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';
import 'package:schoolmanagment/widgets/login_provider.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String? selectLogingroup;
  bool passwordShowhide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, loginprovider, _) {
          return Stack(
            children: [
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderandBackwidget(text: 'Edit Profile'),
                        const SizedBox(height: 40),
                        // Text('Select user group'),
                        // const SizedBox(height: 10),
                        // Container(
                        //   // width: 220,
                        //   // height: 30,
                        //   child: DropdownButtonFormField<String>(
                        //     value: selectLogingroup,
                        //     decoration: InputDecoration(
                        //       hintText: 'Select Yes or No',
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(16),
                        //         borderSide: BorderSide.none,
                        //       ),
                        //       // contentPadding: EdgeInsets.symmetric(
                        //       //   vertical: 5,
                        //       //   horizontal: 10,
                        //       // ), // Adjust padding
                        //       filled: true,
                        //       // fillColor: const Color.fromARGB(160, 223, 221, 221),
                        //     ),
                        //     icon: Icon(
                        //       Icons.arrow_drop_down,
                        //       size: 18,
                        //     ), // Small dropdown icon
                        //     items:
                        //         ["Admin", "Teacher", "Parent"].map((role) {
                        //           return DropdownMenuItem(
                        //             value: role,
                        //             child: Text(role),
                        //           );
                        //         }).toList(),
                        //     onChanged: (value) {
                        //       setState(() {
                        //         selectLogingroup = value;
                        //       });
                        //       _formkey.currentState?.validate();
                        //     },
                        //     onTap: () {
                        //       // setState(() {
                        //       //   isDropdownOpen = !isDropdownOpen; // Toggle icon
                        //       // });
                        //     },
                        //     validator:
                        //         (value) =>
                        //             value == null ? "Select group name" : null,
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        Text('User Name'),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: 'Enter your user name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                          onChanged: (value) {
                            _formkey.currentState?.validate();
                          },

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter user name";
                            } else {
                              return null;
                            }
                          },
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "please enter user name";
                          //   } else if (!RegExp(
                          //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          //   ).hasMatch(value)) {
                          //     return 'Enter a valid email address';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                        const SizedBox(height: 20),
                        Text('Email'),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                          onChanged: (value) {
                            _formkey.currentState?.validate();
                          },

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter email";
                            } else {
                              return null;
                            }
                          },
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "please enter user name";
                          //   } else if (!RegExp(
                          //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          //   ).hasMatch(value)) {
                          //     return 'Enter a valid email address';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                        const SizedBox(height: 10),
                        Text('phone'),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: passwordController,
                          obscureText: passwordShowhide == true ? true : false,
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            // suffixIcon:
                            //     passwordShowhide == true
                            //         ? InkWell(
                            //           onTap: () {
                            //             setState(() {
                            //               passwordShowhide = false;
                            //             });
                            //           },
                            //           child: Icon(Icons.visibility_off),
                            //         )
                            //         : InkWell(
                            //           onTap: () {
                            //             setState(() {
                            //               passwordShowhide = true;
                            //             });
                            //           },
                            //           child: Icon(Icons.visibility),
                            // ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                          onChanged: (value) {
                            _formkey.currentState?.validate();
                          },

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter phone';
                            } else {
                              return null;
                            }
                          },

                          //                   validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter a password';
                          //   } else if (value.length < 6) {
                          //     return 'Password must be at least 6 characters long';
                          //   } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
                          //     return 'Password must contain at least one uppercase letter';
                          //   } else if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
                          //     return 'Password must contain at least one digit';
                          //   } else {
                          //     return null; // Valid password
                          //   }
                          // },
                        ),

                        const SizedBox(height: 35),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Consumer<LoginProvider>(
                              builder: (context, loginprovider, _) {
                                return InkWell(
                                  onTap: () async {
                                    if (_formkey.currentState!.validate()) {
                                      print('validate success');
                                      print(selectLogingroup);
                                      print(usernameController.text);
                                      print(passwordController.text);
                                      await loginprovider.loginFunction(
                                        context,
                                        // selectLogingroup,
                                        usernameController.text,
                                        passwordController.text,
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don’t have an account?'),
                                SizedBox(width: 10),
                                Text(
                                  'Sign Up',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // **Full-Screen Loader**
              if (loginprovider.isLogingLoading)
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
