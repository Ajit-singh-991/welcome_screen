 import 'package:flutter/material.dart';
import 'package:welcome_screen/views/home_page.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const HomePage(),
    );
  }
}




