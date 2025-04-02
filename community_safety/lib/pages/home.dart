import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final blackColor = 0xFF1D1D1D;
  final blueColor = 0xFF49A7FF;
  final yellowColor = 0xFFFFC300;
  final redColor = 0xFFFF0000;
  final greenColor = 0xFF00B731;

  Set<String> selectedFilters = <String>{};

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth = screenWidth * 0.9;

    return Scaffold(
      appBar: appBar(),
      body: mainCard(screenWidth, screenHeight, cardWidth),
    );
  }

  Center mainCard(double screenWidth, double screenHeight, double cardWidth) {
    return Center(
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
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.near_me),
                  labelText: 'Start location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  labelText: 'Destination',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3.5,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildFilterChip("Illuminated streets", Color(yellowColor)),
                  _buildFilterChip("Crowded spaces", Color(blueColor)),
                  _buildFilterChip("Security cameras", Color(greenColor)),
                  _buildFilterChip("Alcohol banned area", Color(redColor)),
                ],
              ),
              SizedBox(
                width: cardWidth * 0.9,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white),
                  label: Text("Find safest route"),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, Color color) {
    return SizedBox(
      width: double.infinity,
      child: FilterChip(
        label: Text(label, textAlign: TextAlign.center),
        selected: selectedFilters.contains(label),
        selectedColor: color.withOpacity(0.3),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              selectedFilters.add(label);
            } else {
              selectedFilters.remove(label);
            }
          });
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color(blackColor),
      toolbarHeight: 100,
      elevation: 10,
      shadowColor: Color(blackColor),
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
