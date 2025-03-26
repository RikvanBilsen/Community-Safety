import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final blueColor = 0xFF49A7FF;
  final yellowColor = 0xFFFFC300;
  final redColor = 0xFFFF0000;
  final greenColor = 0xFF00B731;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth = screenWidth * 0.9;
    double buttonWidth = (cardWidth - 50) / 2;

    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.43,
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
                  'Plan your route',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: cardWidth * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.near_me),
                      labelText: 'Start location',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: cardWidth * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      labelText: 'Destination',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildFilterButton(
                      Icons.lightbulb,
                      "Illuminated streets",
                      Color(yellowColor),
                      buttonWidth,
                    ),
                    _buildFilterButton(
                      Icons.groups,
                      "Crowded spaces",
                      Color(blueColor),
                      buttonWidth,
                    ),
                    _buildFilterButton(
                      Icons.videocam,
                      "Security cameras",
                      Color(greenColor),
                      buttonWidth,
                    ),
                    _buildFilterButton(
                      Icons.no_drinks,
                      "Alcohol banned area",
                      Color(redColor),
                      buttonWidth,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: cardWidth * 0.9,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.search, color: Colors.white),
                    label: Text("Find safest route"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(blueColor),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(
    IconData icon,
    String label,
    Color color,
    double width,
  ) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: color),
        label: Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color(blueColor),
      toolbarHeight: 100,
      elevation: 10,
      shadowColor: Color(blueColor),
      title: Center(
        child: const Text(
          'Travel Safe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
