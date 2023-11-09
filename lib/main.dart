// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:special/pages/details_page.dart';
import 'package:special/pages/home_page.dart';
import 'package:special/pages/login_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/loginpage' :(context) => LoginPage(),
        '/homepage' :(context) => HomePage(),
        '/detailspage' :(context) => DetailsPage(),
      }
    );
  }
}