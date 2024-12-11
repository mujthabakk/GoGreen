import 'package:djangowithflutter/authenticaion/login.dart';
import 'package:djangowithflutter/authenticaion/widgets/text_feild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MobileSingUp extends StatelessWidget {
  const MobileSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final formKey = GlobalKey<FormState>(); // Added form key for validation

    bool isChecked = false; // Replace with state management if needed

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: double.infinity,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 200,
                      maxHeight: 200,
                    ),
                    child: const Image(
                      image: AssetImage('assets/image/image 18 (1).png'),
                      fit: BoxFit.contain, // Ensures the image scales properly
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: formKey, // Assigning form key
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/image/image 19.png'),
                        fit: BoxFit.contain, // Makes it responsive
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
                                    255, 135, 132, 132), // Gray color
                              ),
                            ),
                            TextSpan(
                              text: "Login",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF1BA584), // Green color
                                fontWeight: FontWeight.bold, // Optional: Bold
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPapge()));
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
                                activeColor:
                                    const Color(0xFF1BA584), // Green color
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
                        splashColor: Colors.greenAccent
                            .withOpacity(0.2), // Custom splash color
                        highlightColor:
                            Colors.transparent, // Disable highlight effect
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            debugPrint(
                                "All validations passed. Proceeding with sign-up...");
                            showCustomSnackBar(
                                context, "Sign-up successful!", Colors.green);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPapge()));
                          } else {
                            debugPrint(
                                "Validation failed. Please correct the errors.");
                            showCustomSnackBar(
                                context,
                                "Please fill in all required fields correctly.",
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
                          width: screenWidth * 0.75, // 1/1.5
                          height: screenHeight * 0.055, // 1/18
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
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
