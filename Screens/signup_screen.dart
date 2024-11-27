import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample_app/Components/already_have_an_account_check.dart';
import 'package:firebase_sample_app/Components/constants.dart';
import 'package:firebase_sample_app/Screens/home.dart';
import 'package:firebase_sample_app/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Function to handle signup
  Future<void> createUserWithEmailAndPassword() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Debugging: Print values to verify
    print("Email: $email");
    print("Password: $password");

    if (email.isEmpty) {
      _showErrorDialog("Email cannot be empty.");
      return;
    }

    if (password.isEmpty) {
      _showErrorDialog("Password cannot be empty.");
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
        .hasMatch(email)) {
      _showErrorDialog("Please enter a valid email address.");
      return;
    }

    if (password.length < 6) {
      _showErrorDialog("Password must be at least 6 characters long.");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Create user with Firebase
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("User created: ${userCredential.user?.email}");

      // Navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred. Please try again.";
      if (e.code == 'email-already-in-use') {
        errorMessage = "The email is already registered.";
      } else if (e.code == 'weak-password') {
        errorMessage = "The password is too weak.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      }
      _showErrorDialog(errorMessage);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to show error dialog
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SIGN UP',
              style: GoogleFonts.notoSerif(
                fontSize: 20,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/signup.png',
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
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0), // Margin around the icon
                      child: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.visibility,
                      color: kPrimaryColor,
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
            _isLoading
                ? const CircularProgressIndicator()
                : Container(
                    width: size.width * 0.4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                      ),
                      onPressed: () async {
                        await createUserWithEmailAndPassword();
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(color: kBeigeColor),
                      ),
                    ),
                  ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -160,
            left: -165,
            child: Image.asset('assets/images/signuptop.png'),
          ),
          Positioned(
            bottom: -140,
            left: -140,
            child: Image.asset('assets/images/signupbottom.png'),
          ),
          child,
        ],
      ),
    );
  }
}
