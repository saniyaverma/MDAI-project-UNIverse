import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About us',
            style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            color: Colors.white,
          ),
          ),centerTitle: true,
        backgroundColor: const Color(0xFFFA743C), // Adjust based on your theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // UNIverse logo (if you have one, adjust as needed)
                  Image.asset('assets/images/app_icon.png', height: 150), 
                  SizedBox(height: 20),
                  // App Introduction
                  Text(
                    'Welcome to UNIverse!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'UNIverse is a unified platform for university students to buy, sell, borrow, and lend academic supplies like books, notes, and other essential items. '
                    'Our goal is to create a seamless and efficient exchange environment for students, helping them save time and money.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Key Features
                  Text(
                    'Key Features:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- Buy, sell, borrow, and lend university supplies\n'
                    '- Easy listing of items for sale or rent\n'
                    '- Search and filter options for quick access to items\n'
                    '- Secure and reliable transactions\n'
                    '- User-friendly interface for students\n',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Team Information
                  Text(
                    'Team Members:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- Saniya Verma (Project Lead)\n'
                    '- Sunidhi Gautam\n'
                    '- [Add other team members here]',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Contact Information (if applicable)
                  Text(
                    'For more information or support, please contact us at:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'email@example.com',  // Replace with your actual contact info
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
