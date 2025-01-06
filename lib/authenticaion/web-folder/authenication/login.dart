import 'dart:developer';

import 'package:djangowithflutter/authenticaion/controller/login_bloc.dart';
import 'package:djangowithflutter/authenticaion/controller/singup_bloc.dart';
import 'package:djangowithflutter/authenticaion/service/signup_service.dart';
import 'package:djangowithflutter/authenticaion/singup.dart';
import 'package:djangowithflutter/authenticaion/widgets/text_feild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebLoginPage extends StatelessWidget {
  const WebLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>(); // Add FormKey

    bool isChecked = false; // Replace with state management if needed

    return Scaffold(
      body: Row(
        children: [
          // Left side - Image and Login Form
          SizedBox(
            height: double.infinity,
            width: screenWidth * 0.5,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                          maxHeight: 200,
                        ),
                        child: const Image(
                          image: AssetImage('assets/image/image 18 (1).png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130),
                    child: Form(
                      key: formKey, // Attach the formKey to the Form widget
                      child: BlocProvider(
                        create: (context) => LoginBloc(AuthService()),
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            const Text(
                              "Welcome Back!",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 135, 132, 132),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Sign Up",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF1BA584),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SingupPage(),
                                            ));
                                      },
                                  ),
                                ],
                              ),
                            ),
                            TextFIEID(
                              headtex: 'Email address *',
                              hintText: 'Example@gmail.com',
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email address';
                                }
                                return null;
                              },
                            ),
                            TextFIEID(
                              headtex: 'Password *',
                              hintText: '*************',
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                StatefulBuilder(
                                  builder: (context, setState) {
                                    return Checkbox(
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value ?? false;
                                        });
                                      },
                                      activeColor: const Color(
                                          0xFF1BA584), // Green color
                                    );
                                  },
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 99, 96, 96),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            InkWell(
                              borderRadius: BorderRadius.circular(30),
                              splashColor: Colors.greenAccent.withOpacity(0.2),
                              highlightColor: Colors.transparent,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  log("Form is valid. Proceed with login.");
                                  log("Username: ${nameController.text}");
                                  log("Password: ${passwordController.text}");
                                  // context.read<LoginBloc>().add(
                                  //       LoginEvent.started(
                                  //         password: passwordController.text,
                                  //         username: nameController.text,
                                  //       ),
                                  //     );

                                  // Add your login logic here
                                } else {
                                  log("Form is invalid. Show errors.");
                                }
                              },
                              child: Ink(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF1DA684),
                                      Color(0xFFBEDC7C),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                width: screenWidth * 0.75,
                                height: screenHeight * 0.055,
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Forgot Password button
                            TextButton(
                              onPressed: () {
                                debugPrint("Forgot Password tapped");
                                // Add your functionality for Forgot Password here
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Color(
                                      0xFF1BA584), // Custom color for text
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.25,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                                maxHeight: 200,
                              ),
                              child: const Image(
                                image:
                                    AssetImage('assets/image/image 19 (1).png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Right side - Background Image
          Container(
            height: screenHeight,
            width: screenWidth * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/mobile_singup_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/image/logo_moblie_singup.png'),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Never forget to go green everyday \n because the greener you go the higher you get',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
