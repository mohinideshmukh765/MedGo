
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medgo/buyer/medicine_delivery_page.dart';
import 'package:medgo/buyer/registration_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          'Login',
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
              Text(
                'Phone Number',
                style: GoogleFonts.lato(color: Colors.grey[600]),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Password',
                style: GoogleFonts.lato(color: Colors.grey[600]),
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 40),
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
                    'Login',
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
                    MaterialPageRoute(builder: (context) => const RegistrationPage()),
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Don't have an account? Please register",
                    style: GoogleFonts.lato(color: Colors.deepPurple),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 300,
                width: double.infinity,
                color: const Color(0xFFC4C4C4),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                     Positioned(
                      bottom: 0,
                      child: Container(
                        height: 250,
                        width: 400,
                        decoration: const BoxDecoration(
                           color: Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(75),
                            topRight: Radius.circular(75),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 150,
                      child: Container(
                        width: 200,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE6E6E6),
                           borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                    ),
                     Positioned(
                      bottom: 70,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFFA9A9A9).withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                     Positioned(
                      bottom: 30,
                      child: Text(
                        'MEDICINES ARE IMPORTANT, SO\nYOU SHOULDN\'T HAVE TO WAIT FOR THEM.\nTHAT\'S WHY WE\'RE HERE.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
