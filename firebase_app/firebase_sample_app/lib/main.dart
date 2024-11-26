import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_sample_app/Components/constants.dart';
import 'package:firebase_sample_app/Screens/WelcomeScreen/welcome_screen.dart';
import 'package:firebase_sample_app/Screens/HomePage/home.dart'; // Import HomePage
import 'package:firebase_sample_app/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Center(
          child: Image.asset(
            'assets/images/logo.png', // Path to your logo
            width: double.infinity, // Full width
            height: double.infinity, // Full height
            fit: BoxFit.contain, // Ensure proper scaling
          ),
        ),
        splashIconSize: double.infinity, // Makes sure the logo takes up the full space
        backgroundColor: kBeigeColor, // Match the background color of your logo
        duration: 3000, // Duration for the splash screen to be visible
        splashTransition: SplashTransition.fadeTransition, // Fade transition effect
        nextScreen: const AuthWrapper(), // Show the AuthWrapper instead of directly to WelcomeScreen
      ),
    );
  }
}

// AuthWrapper listens for Firebase authentication state
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for changes in authentication state
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while Firebase is determining the auth state
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // User is logged in, navigate to HomePage
          return const HomePage();
        } else {
          // User is not logged in, navigate to WelcomeScreen
          return const WelcomeScreen();
        }
      },
    );
  }
}

