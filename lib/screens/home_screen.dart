import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
        title: const Text("오늘의 웹툰",style: TextStyle(fontSize: 30, height: 1.0),
        ),
      ),
    );
  }
}


