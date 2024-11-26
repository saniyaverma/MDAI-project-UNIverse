import 'dart:async';
import 'package:firebase_sample_app/Components/constants.dart';
import 'package:firebase_sample_app/Screens/WelcomeScreen/welcome_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen(),));
    });

  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Center(
        child: Container(
          height:double.infinity,
          color: kBeigeColor,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}