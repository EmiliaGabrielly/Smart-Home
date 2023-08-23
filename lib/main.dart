import 'package:flutter/material.dart';
import 'package:smart_home/pages/home_page.dart';

void main() {
  runApp(const SmartHome());
}

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Home App",
      home: HomePage(),
    );
  }
}