// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  final blackColor = 0xFF1D1D1D;

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
                    onPressed: () {},
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

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color(blackColor),
      toolbarHeight: 100,
      elevation: 10,
      shadowColor: Color(blackColor),
      iconTheme: IconThemeData(
        color: Colors.white, // Kleur van het terug-pijltje
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
