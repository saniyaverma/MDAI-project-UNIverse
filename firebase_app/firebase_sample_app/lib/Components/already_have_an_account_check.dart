import 'package:firebase_sample_app/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press; 
  const AlreadyHaveAnAccountCheck({
    super.key, this.login = true, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account? " : "Already have an Account? ",
          style: GoogleFonts.merriweather(
            color: kDarkBrownColor,
          ),
        ),
        GestureDetector(
          onTap :press,
          child: Text(
            login ? 'Sign Up' : 'Sign In',
            style: GoogleFonts.merriweather(
                color: kHotRedColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}