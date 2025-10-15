
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMedicinesPage extends StatefulWidget {
  const AddMedicinesPage({super.key});

  @override
  State<AddMedicinesPage> createState() => _AddMedicinesPageState();
}

class _AddMedicinesPageState extends State<AddMedicinesPage> {
  final List<Map<String, dynamic>> _medicines = [
    {'name': 'Aspirin 500mg', 'manufacturer': 'PharmaCorp', 'strip_size': 10, 'selected': false},
    {'name': 'Ibuprofen 200mg', 'manufacturer': 'HealthPlus', 'strip_size': 15, 'selected': false},
    {'name': 'Paracetamol 325mg', 'manufacturer': 'MedLife', 'strip_size': 12, 'selected': true},
    {'name': 'Amoxicillin 250mg', 'manufacturer': 'CureAll', 'strip_size': 20, 'selected': false},
    {'name': 'Cetirizine 10mg', 'manufacturer': 'VitalCare', 'strip_size': 10, 'selected': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicines', style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _medicines.length,
              itemBuilder: (context, index) {
                return _buildMedicineItem(index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
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
                  'Save',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget _buildMedicineItem(int index) {
    final medicine = _medicines[index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: CheckboxListTile(
        value: medicine['selected'],
        onChanged: (value) {
          setState(() {
            _medicines[index]['selected'] = value!;
          });
        },
        title: Text(medicine['name'], style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Manufacturer: ${medicine['manufacturer']}'),
            Text('Strip Size: ${medicine['strip_size']}'),
          ],
        ),
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
