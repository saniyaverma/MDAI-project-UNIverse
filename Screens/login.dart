import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample_app/Components/already_have_an_account_check.dart';
import 'package:firebase_sample_app/Components/constants.dart';
import 'package:firebase_sample_app/Screens/home.dart';
import 'package:firebase_sample_app/Screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUserWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      // Navigate to HomePage on successful login and remove all previous pages
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (Route<dynamic> route) => false, // This will remove all previous routes
      );

      print(userCredential);
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(e.message ?? "An unknown error occurred.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'LOGIN',
            style: GoogleFonts.notoSerif(
                fontSize: 20,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/images/logincred.png',
            height: size.height * 0.35,
          ),
          Container(
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 214, 184),
              borderRadius: BorderRadius.circular(29),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8.0), // Margin around the icon
                    child: Icon(
                      Icons.email,
                      color: kPrimaryColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  hintText: "Enter your email",
                  hintStyle:
                      GoogleFonts.firaSansCondensed(color: kDarkBrownColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29.0),
                      borderSide: BorderSide.none)),
            ),
          ),
          Container(
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 214, 184),
              borderRadius: BorderRadius.circular(29),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: passwordController,
              obscureText: !_isPasswordVisible, // Toggle visibility
              decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8.0), // Margin around the icon
                    child: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  hintText: "Enter your password",
                  hintStyle:
                      GoogleFonts.firaSansCondensed(color: kDarkBrownColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29.0),
                      borderSide: BorderSide.none)),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onDoubleTap: () {
                // Uncomment this when ForgetPasswordScreen is implemented
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ForgetPasswordScreen(),
                //   ),
                // );
              },
              child: Text(
                "Forgot Password?             ",
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 87, 49, 3),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            width: size.width * 0.4,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () async {
                await loginUserWithEmailAndPassword();
              },
              child: const Text(
                "LOGIN",
                style: TextStyle(color: kBeigeColor),
              ),
            ),
          ),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignupScreen()));
            },
          ),
        ],
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
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[

          Positioned(
            top: 140,
            right: -30,
            child: Image.asset(
              'assets/images/logincentre.png',
              height: 450,
            ),
          ),
          Positioned(
            bottom: -200,
            right: -150,
            child: Image.asset('assets/images/loginbottom.png'),
          ),
          Positioned(
              top: -200,
              left: -200,
              child: Image.asset('assets/images/logintop.png')),
          child,
        ],
      ),
    );
  }
}

class LoginSuccessful extends StatefulWidget {
  const LoginSuccessful({super.key});

  @override
  State<LoginSuccessful> createState() => _LoginSuccessfulState();
}

class _LoginSuccessfulState extends State<LoginSuccessful> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      color: kBeigeColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/success.png',
          ),
        ],
      ),
    );
  }
}