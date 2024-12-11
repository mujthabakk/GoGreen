import 'package:djangowithflutter/authenticaion/login.dart';
import 'package:djangowithflutter/authenticaion/view/mobile-folder/authenication/singup.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image container
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/mobile_singup_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: screenHeight * 0.35,
            child: const Center(
                child: Image(
                    image: AssetImage('assets/image/logo_moblie_singup.png'))),
          ),
          // White container with border color at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.67, // 1/1.5
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Color(0xFFB9DB7E),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.625, // 1/1.6
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Color(0xFF3FB283),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.588, // 1/1.7
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Image(
                          image:
                              AssetImage('assets/image/singup_img_3 (4).png'),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage(
                                'assets/image/logo2_mobile_singup.png'),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Never forget to go green everyday, because the greener you go the higher you get',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            splashColor: Colors.white10,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MobileSingUp()));
                            },
                            child: Container(
                              width: screenWidth * 0.75, // 1/1.5
                              height: screenHeight * 0.055, // 1/18
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
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginPapge()));
                            },
                            child: Container(
                              width: screenWidth * 0.75, // 1/1.5
                              height: screenHeight * 0.055, // 1/18
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
                              child: const Center(
                                child: Text(
                                  ' Log In',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 20), // Adjust space for small screens
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage('assets/image/singup_img1.png'),
                          width: 82,
                          height: 119,
                        ),
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
  }
}
