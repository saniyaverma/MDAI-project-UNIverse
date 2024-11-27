import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FoundScreen extends StatefulWidget {
  const FoundScreen({super.key});

  @override
  State<FoundScreen> createState() => _FoundScreenState();
}

class _FoundScreenState extends State<FoundScreen> {
  final _formKey = GlobalKey<FormState>();
  String itemName = '';
  String itemDescription = '';
  String foundLocation = '';
  String contactInfo = '';
  String itemCategory = 'Select option';

  final List<String> categories = ['Select option', 'Book', 'ID Card', 'Electronics', 'Other'];

  final ImagePicker picker = ImagePicker();
  XFile? pickedFile;

  Future<void> _pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      debugPrint('Picked image path: ${image.path}');
    } else {
      debugPrint('No image selected');
    }
    setState(() {
      pickedFile = image;
    });
  }

  void _removeImage() {
    setState(() {
      pickedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFA743C), // Updated AppBar color
        title: Text(
          'Found Something?',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20), // Top spacing
              Text(
                'Help someone by reporting!',
                style: GoogleFonts.openSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Updated text color
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add details of the found item:',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black, // Updated secondary text color
                ),
              ),
              const SizedBox(height: 24), // Spacing before form

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Item Name',
                        // labelStyle: const TextStyle(color: Color(0xFFFA743C)), // Updated label color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFA743C)),
                        ),
                      ),
                      onSaved: (value) {
                        setState(() {
                          itemName = value ?? '';
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter item name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      value: itemCategory,
                      decoration: InputDecoration(
                        labelText: 'Category',
                        // labelStyle: const TextStyle(color: Color(0xFFFA743C)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFA743C)),
                        ),
                      ),
                      items: categories.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          itemCategory = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value == 'Select option') {
                          return 'Please select item category';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                        // labelStyle: const TextStyle(color: Color(0xFFFA743C)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFA743C)),
                        ),
                      ),
                      onSaved: (value) {
                        setState(() {
                          itemDescription = value ?? '';
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter item description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Location Found',
                        // labelStyle: const TextStyle(color: Color(0xFFFA743C)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFA743C)),
                        ),
                      ),
                      onSaved: (value) {
                        setState(() {
                          foundLocation = value ?? '';
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the location where you found the item';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Your Contact Information',
                        // labelStyle: const TextStyle(color: Color(0xFFFA743C)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFA743C)),
                        ),
                      ),
                      onSaved: (value) {
                        setState(() {
                          contactInfo = value ?? '';
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide your contact information';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    Center(
                      child: Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: _pickImage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[400], 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 20,
                              ),
                            ),
                            icon: const Icon(Icons.image, color: Colors.black),
                            label: Text(
                              'Add Image',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (pickedFile != null) ...[
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.file(
                                File(pickedFile!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: _removeImage,
                              child: Text(
                                'Remove Image',
                                style: GoogleFonts.openSans(
                                  color: const Color(0xFFFF6B6B), // Remove text color
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24), // Spacing before button

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Found item reported!')),
                      );
                      setState(() {
                        itemName = '';
                        itemDescription = '';
                        foundLocation = '';
                        contactInfo = '';
                        itemCategory = 'Select option';
                        pickedFile = null;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFA743C), // Updated button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  ),
                  child: const Text(
                    'Report Found Item',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
