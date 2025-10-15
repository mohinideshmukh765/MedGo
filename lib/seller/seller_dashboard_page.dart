
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medgo/seller/add_medicines_page.dart';
import 'package:medgo/seller/seller_profile_page.dart';

class SellerDashboardPage extends StatelessWidget {
  const SellerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildDashboardCard('Orders in progress', '2'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDashboardCard('Previous orders', '10'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Recent Orders',
              style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildRecentOrder('Ethan Carter', 'assets/images/ethan.png', '10 min ago', '123456'),
            _buildRecentOrder('Olivia Bennett', 'assets/images/olivia.png', '30 min ago', '789012'),
            _buildRecentOrder('Noah Thompson', 'assets/images/noah.png', '1 hour ago', '345678'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddMedicinesPage()),
            );
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SellerProfilePage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildDashboardCard(String title, String count) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.lato(color: Colors.black54)),
          const SizedBox(height: 8),
          Text(count, style: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRecentOrder(String name, String imagePath, String time, String orderId) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(name, style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        subtitle: Text('Order ID: $orderId'),
        trailing: Text(time, style: GoogleFonts.lato(color: Colors.grey)),
      ),
    );
  }
}
