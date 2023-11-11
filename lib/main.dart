// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:special/pages/details_page.dart';
import 'package:special/pages/home_page.dart';
import 'package:special/pages/login_page.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;

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