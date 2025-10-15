import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
          'My Cart',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCartItem(
                'Paracetamol', '500mg', 2, 'assets/images/paracetamol.png'),
            _buildCartItem(
                'Loratadine', '10mg', 1, 'assets/images/loratadine.png'),
            _buildCartItem(
                'Ibuprofen', '200mg', 3, 'assets/images/ibuprofen.png'),
            const SizedBox(height: 30),

            // Prescription Upload Section
            Text('Prescription',
                style: GoogleFonts.lato(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.deepPurple,
                    style: BorderStyle.solid,
                    width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Icon(Icons.upload_file,
                      color: Colors.deepPurple, size: 50),
                  const SizedBox(height: 10),
                  Text('Upload Prescription',
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                  Text('Required for certain medications',
                      style: GoogleFonts.lato(color: Colors.grey)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Select File'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Order Summary
            Text('Order Summary',
                style: GoogleFonts.lato(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const ListTile(leading: Text('Subtotal'), trailing: Text('\$25.00')),
            const ListTile(leading: Text('Delivery'), trailing: Text('\$5.00')),
            const ListTile(
              leading:
                  Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing:
                  Text('\$30.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 20),

            // Place Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Place Order',
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text('Upload a prescription to enable ordering',
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(
      String name, String strength, int quantity, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 50, height: 50),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                Text(strength, style: GoogleFonts.lato(color: Colors.grey)),
              ],
            ),
            const Spacer(),
            IconButton(icon: const Icon(Icons.remove), onPressed: () {}),
            Text('$quantity'), // ✅ Fixed here
            IconButton(icon: const Icon(Icons.add), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
