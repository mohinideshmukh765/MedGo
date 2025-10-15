
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medgo/buyer/login_page.dart';
import 'package:medgo/buyer/medicine_delivery_page.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Create Account',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildTextField(label: 'Name'),
              const SizedBox(height: 20),
              _buildTextField(label: 'Mobile'),
              const SizedBox(height: 20),
              _buildTextField(label: 'Email'),
              const SizedBox(height: 20),
              _buildTextField(label: 'Address'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: _buildTextField(label: 'City')),
                  const SizedBox(width: 20),
                  Expanded(child: _buildTextField(label: 'State')),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField(label: 'Country'),
              const SizedBox(height: 20),
              _buildTextField(label: 'Password', obscureText: true),
              const SizedBox(height: 20),
              _buildTextField(label: 'Confirm Password', obscureText: true),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enable Device Location',
                    style: GoogleFonts.lato(color: Colors.grey[600]),
                  ),
                  Switch(value: false, onChanged: (value) {}),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MedicineDeliveryPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Already have an account? Sign in",
                    style: GoogleFonts.lato(color: Colors.deepPurple),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lato(color: Colors.grey[600]),
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: 'Enter your \$label',
          ),
        ),
      ],
    );
  }
}
