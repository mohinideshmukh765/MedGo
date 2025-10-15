import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

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
          'Orders',
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
          children: [
            _buildOrderCard(
              context,
              items: '1 item',
              date: '15/12/2023, 11:30 AM',
              orderId: '2468135790',
              status: 'Pending',
              statusColor: Colors.orange,
              child: const Text(
                'Wait for the seller to accept the order',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            _buildOrderCard(
              context,
              items: '2 items',
              date: '12/12/2023, 10:00 AM',
              orderId: '1234567890',
              status: 'Rejected',
              statusColor: Colors.red,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reason for rejection:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Out of stock.'),
                ],
              ),
            ),
            _buildOrderCard(
              context,
              items: '3 items',
              date: '11/11/2023, 09:00 AM',
              orderId: '9876543210',
              status: 'Delivered',
              statusColor: Colors.green,
              child: _buildOrderTracking(),
            ),
            _buildOrderCard(
              context,
              items: '1 item',
              date: '13/12/2023, 08:00 AM',
              orderId: '1122334455',
              status: 'Accepted',
              statusColor: Colors.blue,
              child: _buildPaymentMethod(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 3,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildOrderCard(
    BuildContext context, {
    required String items,
    required String date,
    required String orderId,
    required String status,
    required Color statusColor,
    required Widget child,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$items - $date'),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Order ID: $orderId',
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(height: 20),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTracking() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Tracking',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        _buildTrackingStep('Accepted', isCompleted: true),
        _buildTrackingStep('Preparing Order', isCompleted: true),
        _buildTrackingStep('Out for delivery', isCompleted: true),
        _buildTrackingStep('Delivered', isCompleted: true, isLast: true),
      ],
    );
  }

  Widget _buildTrackingStep(
    String title, {
    bool isCompleted = false,
    bool isLast = false,
  }) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.check_circle,
              color: isCompleted ? Colors.deepPurple : Colors.grey,
            ),
            if (!isLast)
              Container(
                height: 20,
                width: 2,
                color: isCompleted ? Colors.deepPurple : Colors.grey,
              ),
          ],
        ),
        const SizedBox(width: 10),
        Text(title),
      ],
    );
  }

  Widget _buildPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose a payment method',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        ListTile(
          tileColor: Colors.grey[200],
          title: const Text('UPI'),
          subtitle: const Text('Google Pay, PhonePe, etc.'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        const SizedBox(height: 10),
        ListTile(
          tileColor: Colors.grey[200],
          title: const Text('Cash on Delivery'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ],
    );
  }
}
