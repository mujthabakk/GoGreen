import 'dart:developer';

import 'package:djangowithflutter/authenticaion/login.dart';
import 'package:djangowithflutter/authenticaion/widgets/text_feild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:djangowithflutter/authenticaion/controller/singup_bloc.dart';
import 'package:djangowithflutter/authenticaion/service/signup_service.dart';

class WebSingupPage extends StatelessWidget {
  const WebSingupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final fromkey = GlobalKey<FormState>();

    bool isChecked = false; // Replace with state management if needed

    return Scaffold(
      body: BlocProvider(
        create: (context) => SingupBloc(AuthService()),
        child: Row(
          children: [
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
                        key: fromkey,
                        child: BlocConsumer<SingupBloc, SingupState>(
                          listener: (context, state) {
                            state.when(
                              initial: () {},
                              loading: () {
                                showCustomSnackBar(
                                    context, "Signing up...", Colors.orange);
                              },
                              success: (signupModel) {
                                showCustomSnackBar(
                                    context,
                                    "Sign-up successful: ${signupModel.username}",
                                    Colors.green);
                                context.push(LoginPapge.routePath);
                              },
                              failure: (message) {
                                showCustomSnackBar(
                                    context, message, Colors.red);
                              },
                            );
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/image/image 19.png'),
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                const Text(
                                  "Create your account.",
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
                                        text: "Already have an account? ",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color.fromARGB(
                                              255, 135, 132, 132),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Login",
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF1BA584),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.push(LoginPapge.routePath);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                                TextFIEID(
                                  headtex: 'Full Name *',
                                  hintText: 'Enter your full name',
                                  controller: nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your full name';
                                    }
                                    return null;
                                  },
                                ),
                                TextFIEID(
                                  headtex: 'Email address *',
                                  hintText: 'Enter your email address',
                                  controller: emailController,
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
                                  controller: passController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
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
                                          activeColor: const Color(0xFF1BA584),
                                        );
                                      },
                                    ),
                                    const Text(
                                      "I agree to the terms and conditions",
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
                                  splashColor:
                                      Colors.greenAccent.withOpacity(0.2),
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    if (fromkey.currentState?.validate() ??
                                        false) {
                                      log("message23453367");
                                      context.read<SingupBloc>().add(
                                            SingupEvent.started(
                                              email: emailController.text,
                                              password: passController.text,
                                              username: nameController.text,
                                            ),
                                          );
                                    } else {
                                      showCustomSnackBar(
                                          context,
                                          "Please fill in all required fields correctly.",
                                          Colors.red);
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
                                        'Sign Up',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: screenHeight,
              width: screenWidth * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/image/mobile_singup_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Image(
                  image: AssetImage('assets/image/logo_moblie_singup.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomSnackBar(BuildContext context, String message, Color color) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 20,
      left: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
