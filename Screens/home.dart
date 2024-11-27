import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample_app/Screens/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_sample_app/Screens/welcome_screen.dart';
import 'package:firebase_sample_app/Screens/about_us.dart';
import 'package:firebase_sample_app/Screens/buy.dart'; 
import 'package:firebase_sample_app/Screens/sell.dart'; 
import 'package:firebase_sample_app/Screens/found.dart';
import 'package:firebase_sample_app/Screens/lost.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedOption = 'Buy'; // Default selected option
  String? userEmail;

  @override
  void initState() {
    super.initState();
    // Fetch the user's email
    userEmail = FirebaseAuth.instance.currentUser?.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFA743C), // Orange-Red
        title: Text(
          'UNIverse',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            color: Colors.white, // White for better contrast
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFFef2e2), // Soft Beige for drawer background
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFFFA743C), // Orange-Red
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'UNIverse',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hi, ${userEmail ?? "Guest"}',  // Show the user's email or Guest if not logged in
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              _buildDrawerItem(Icons.home, 'Home', () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
              }),
              _buildDrawerItem(Icons.list, 'My Listings', () {}),
              _buildDrawerItem(Icons.info, 'About Us', () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AboutUsScreen()));
              }),
              _buildDrawerItem(Icons.help, 'Help', () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ContactUsScreen()));
              }),
              _buildDrawerItem(Icons.logout, 'Log out', () {
                // Sign out and redirect to WelcomeScreen
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                );
              }),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Main content with icons (no "Sell" transition)
              Image.asset(
                'assets/images/app_icon.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'What are you looking for today?',
                style: TextStyle(
                  fontSize: 22, // Larger text for the section header
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Horizontal Icon Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconOption('Buy', Icons.shopping_cart_outlined),
                  _buildIconOption('Sell', Icons.attach_money_outlined),
                  _buildIconOption('Lost', Icons.search_outlined),
                  _buildIconOption('Found', Icons.check_circle_outline),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFA743C), // Orange-Red for the navbar
        selectedItemColor: const Color(0xFFFAB130), // Golden Yellow for active items
        unselectedItemColor: const Color(0xFFFef2e2), // Beige for inactive items
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(), // Ensures the FAB is perfectly round
        onPressed: () {
          // Action when the FAB is pressed
          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen()));
        },
        backgroundColor: const Color(0xFFFAB130), // Golden Yellow for FAB
        child: const Icon(
          Icons.feedback,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildIconOption(String label, IconData icon) {
    final isSelected = label == selectedOption;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = label;
        });

        // Navigate to BuyScreen when "Buy" is tapped
        if (label == 'Buy') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BuyScreen()), // Navigate to BuyScreen
          );
        }
        // Navigate to SellScreen when "Sell" is tapped
        if (label == 'Sell') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SellScreen()), // Navigate to SellScreen
          );
        }
        // Navigate to FoundScreen when "Found" is tapped
        if (label == 'Found') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FoundScreen()), // Navigate to FoundScreen
          );
        }
        // Navigate to LostScreen when "Lost" is tapped
        if (label == 'Lost') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LostScreen()), // Navigate to LostScreen
          );
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: isSelected ? const Color(0xFFFA743C) : Colors.grey[300],
            child: Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFFFA743C) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFFA8130)), 
      title: Text(title, style: const TextStyle(color: Color(0xFFFA8130))),
      onTap: onTap,
    );
  }
}

