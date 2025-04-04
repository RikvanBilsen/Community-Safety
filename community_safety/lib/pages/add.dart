// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();

  final int blackColor = 0xFF1D1D1D;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth = screenWidth * 0.9;

    return Scaffold(
      appBar: appBar(),
      body: addCameraForm(screenWidth, screenHeight, cardWidth),
    );
  }

  Center addCameraForm(
    double screenWidth,
    double screenHeight,
    double cardWidth,
  ) {
    return Center(
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add private camera',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              TextField(
                controller: postalCodeController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_pin),
                  labelText: 'Postal code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: houseNumberController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.house),
                  labelText: 'House number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: cardWidth * 0.6,
                  child: ElevatedButton.icon(
                    onPressed: () => addCameraToFirestore(),
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text("Add Camera"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(blackColor),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addCameraToFirestore() async {
    String postalCode = postalCodeController.text.trim();
    String houseNumber = houseNumberController.text.trim();

    if (postalCode.isEmpty || houseNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Fill out both fields")),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('cameras').add({
        'postal_code': postalCode,
        'house_number': houseNumber,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Camera added!"), duration: Duration(seconds: 3)),
      );

      postalCodeController.clear();
      houseNumberController.clear();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color(blackColor),
      toolbarHeight: 100,
      elevation: 10,
      shadowColor: Color(blackColor),
      iconTheme: IconThemeData(
        color: Colors.white, 
      ),
      title: Text(
        'Travel Safe',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
    );
  }
}
