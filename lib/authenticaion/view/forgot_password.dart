import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:djangowithflutter/authenticaion/login.dart';
import 'package:djangowithflutter/authenticaion/widgets/text_feild.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>(); // Form Key for validation
    final emailController = TextEditingController();

    // Check if screen width is less than 800px to determine mobile layout
    bool isMobile = screenWidth < 800;

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Ensures layout adjusts when keyboard appears
      body: isMobile
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center horizontally
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Show logo on both mobile and web
                    SizedBox(height: screenHeight * 0.15),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Image.asset(
                        'assets/image/logo2_mobile_singup.png', // Adjust image path accordingly
                        height: screenHeight *
                            0.2, // Adjust height based on screen size
                        width: screenWidth *
                            0.5, // Adjust width based on screen size
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Text(
                      "Forget Password",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Enter your email address to reset your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    TextFIEID(
                      headtex: 'Email address *',
                      hintText: 'Example@gmail.com',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Colors.greenAccent.withOpacity(0.2),
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          showCustomSnackBar(context,
                              "Check your email for reset link", Colors.green);
                        } else {
                          showCustomSnackBar(
                              context,
                              "Please enter a valid email address.",
                              Colors.red);
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
                            'Reset Password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Remember your password? ",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff878484),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPapge(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Row(
              children: [
                // Left side - Form Section for Web (Row Layout for Web)
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Show logo on both mobile and web
                            Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Image.asset(
                                'assets/image/logo2_mobile_singup.png',
                                height: screenHeight * 0.2,
                                width: screenWidth * 0.4,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const Text(
                              "Forget Password",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              "Enter your email address to reset your password.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.04),
                            TextFIEID(
                              headtex: 'Email address *',
                              hintText: 'Example@gmail.com',
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email address';
                                } else if (!RegExp(r'\S+@\S+\.\S+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            InkWell(
                              borderRadius: BorderRadius.circular(30),
                              splashColor: Colors.greenAccent.withOpacity(0.2),
                              highlightColor: Colors.transparent,
                              onTap: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  showCustomSnackBar(
                                      context,
                                      "Check your email for reset link",
                                      Colors.green);
                                } else {
                                  showCustomSnackBar(
                                      context,
                                      "Please enter a valid email address.",
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
                                    'Reset Password',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Remember your password? ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 135, 132, 132),
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPapge(),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Right side - Background Image for Web Version
                Container(
                  width: screenWidth * 0.5,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/image/mobile_singup_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image:
                              AssetImage('assets/image/logo_moblie_singup.png'),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Reset Password",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

void showCustomSnackBar(BuildContext context, String message, Color color) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.8,
      left: MediaQuery.of(context).size.width * 0.2,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 16),
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
