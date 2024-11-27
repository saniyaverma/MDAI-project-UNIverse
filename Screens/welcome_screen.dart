import 'package:firebase_sample_app/Components/constants.dart';
import 'package:firebase_sample_app/Screens/login.dart';
import 'package:firebase_sample_app/Screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(), // Use Scaffold to provide default safe layout
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 450,
              child: Text(
                "Welcome to",
                style: GoogleFonts.vollkorn(
                  fontSize: 30,
                  color: kDarkBrownColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Login Button
            Container(
              width: size.width * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }),
                    );
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // Signup Button
            Container(
              width: size.width * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 252, 234, 212),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const SignupScreen();
                      }),
                    );
                    // Navigation logic
                  },
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Main background image
          Positioned(
            bottom: 60,
            child: Image.asset(
              'assets/images/welcome.png',
              width: size.width * 0.9,
              height: size.height * 0.8,
            ),
          ),
          // Top decorative image
          Positioned(
            top: -100, // Adjusted to avoid negative positioning
            left: -120,
            child: Image.asset(
              'assets/images/welcometop.png',
              width: size.width * 0.8,
            ),
          ),
          // Bottom decorative image
          Positioned(
            bottom: -100, // Adjusted to avoid negative positioning
            left: -140,
            child: Image.asset(
              'assets/images/welcomebottom.png',
              width: size.width * 0.8,
            ),
          ),

          Positioned(
            top: 140,
            child: Image.asset(
              'assets/images/text.png',
              height: size.height * 0.30,
              width: size.width * 0.8,
            ),),
          // Main content
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}