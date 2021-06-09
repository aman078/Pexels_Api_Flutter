import 'package:flutter/material.dart';
import 'package:api_test/views/home.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      title: 'Wallpaper Aman',
      home: Home(),
    );
  }
}
