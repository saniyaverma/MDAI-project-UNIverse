import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
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
          'Buy Items',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            color: Colors.white, // White for better contrast
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are you looking for?',
              style: TextStyle(
                fontSize: 22, // Larger text for the section header
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Hello, ${userEmail ?? "Guest"}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            // Example category filters or search options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryOption('Books', Icons.book),
                _buildCategoryOption('Electronics', Icons.computer),
                _buildCategoryOption('Furniture', Icons.chair),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Listings',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Example item listings
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Placeholder for the number of items
                itemBuilder: (context, index) {
                  return _buildListingItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryOption(String label, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Handle category selection here
        print('$label selected');
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFFFAB130), // Golden yellow
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListingItem() {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(
          'assets/images/item_image.jpg', // Placeholder for item image
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: const Text('Item Name'),
        subtitle: const Text('Item Description'),
        trailing: Text('\$20.00'),
        onTap: () {
          // Handle item selection here
          print('Item tapped');
        },
      ),
    );
  }
}
