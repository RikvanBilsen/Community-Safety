import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final blueColor = 0xFF49A7FF;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const Center(child: Text('Welcome to Community Safety!')),
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
            color: Colors.white
            ),
        ),
      ),
    );
  }
}
