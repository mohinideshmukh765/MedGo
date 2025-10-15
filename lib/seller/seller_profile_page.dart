
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerProfilePage extends StatelessWidget {
  const SellerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Basic Information'),
            _buildInfoCard('Seller Name', 'Anushka Sharma'),
            _buildInfoCard('Shop Name', 'Anushka\'s Meds'),
            _buildChangeProfilePic(),
            _buildInfoCard('Location/Address', '123, Medico Lane, Pharma City'),
            _buildInfoCard('Phone', '+91 98765 43210'),
            _buildInfoCard('Email', 'anushkasharma@medgo.com'),
            const SizedBox(height: 24),
            _buildSectionTitle('Financial Info'),
            _buildInfoCard('UPI ID', 'anushkasharma@upi'),
            _buildInfoCard('Bank Account Number', '**** **** **** 1234'),
            _buildInfoCard('IFSC Code', 'MEDG0001234'),
            const SizedBox(height: 24),
            _buildSectionTitle('Security'),
            _buildChangePassword(),
            const SizedBox(height: 32),
            _buildSaveChangesButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Add Medicine'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            // TODO: Navigate to Add Medicine page
          }
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(title, style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.lato(color: Colors.grey[600])),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(value, style: GoogleFonts.lato(fontSize: 16)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildChangeProfilePic() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.purple[50],
      child: const ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/sophia.png'), // Placeholder
        ),
        title: Text('Change Profile Picture'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  Widget _buildChangePassword() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.purple[50],
      child: const ListTile(
        title: Text('Change Password'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  Widget _buildSaveChangesButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Save Changes',
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
