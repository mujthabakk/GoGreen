import 'dart:developer';

import 'package:djangowithflutter/authenticaion/singup.dart';
import 'package:djangowithflutter/authenticaion/widgets/text_feild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MobileLogin extends StatelessWidget {
  const MobileLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final fromkey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: double.infinity,
        width: screenWidth,
        child: Stack(
          children: [
            // Main content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: fromkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
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
                                      builder: (context) => const SingupPage(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      // const TextFIEID(
                      //   headtex: 'Email address *',
                      //   hintText: 'Example@gmail.com',
                      // ),
                      TextFIEID(
                        headtex: 'Username *',
                        hintText: 'enter username',
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter username';
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
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),
                      InkWell(
                        splashColor: Colors.greenAccent.withOpacity(0.2),
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (fromkey.currentState!.validate()) {
                            log("Form is valid.");
                            // Proceed with the login logic
                          } else {
                            log("Validation failed.");
                          }
                        },
                        child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
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
                            color: Color(0xFF1BA584), // Custom color for text
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

            // Image at the top-left corner
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 200,
                ),
                child: const Image(
                  image: AssetImage('assets/image/image 18 (1).png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Image at the bottom-right corner
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 200,
                ),
                child: const Image(
                  image: AssetImage('assets/image/image 19 (1).png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
