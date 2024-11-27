import 'package:firebase_sample_app/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(MaterialApp(
    home: ContactUsScreen(),
    routes: {
      '/home': (context) => HomePage(), // Replace HomeScreen with your home page widget
    },
  ));
}

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Feedback' , style: GoogleFonts.frankRuhlLibre(),),
        backgroundColor: Color(0xFFFA743C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Background Image properly positioned below AppBar
            Container(
              width: double.infinity, // Full width of the screen
              height: 500, // Set height
              decoration: const BoxDecoration(
                image: DecorationImage(

                  image: AssetImage('assets/images/Contact_bg.png'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20), // Spacing between the image and the text content

            // Text Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top Text (Friendly and conversational)
                   Text(
                    "Wanna talk to us?",
                    style: GoogleFonts.notoSerif(
                      fontSize: 28, // Increased font size for emphasis
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),

                  // Subtitle Text
                  Text(
                    "No worries, you can contact us here:",
                    style: GoogleFonts.vollkorn(
                      fontSize: 20, // Increased font size
                      color: const Color.fromARGB(255, 73, 69, 69),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                  // Dummy Email ID
                 Text(
                    "abc123@email.com",
                    style: GoogleFonts.alegreya(
                      fontSize: 25, // Increased font size
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFA8130),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFFA743C),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); // Make sure '/home' route is defined
              },
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.contact_support),
            label: "Contact",
          ),
        ],
      ),
    );
  }
}