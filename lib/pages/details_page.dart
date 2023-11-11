// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  TextEditingController _codeController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  List<List<String>> employeeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),

      body: Column(
        children: [
          Text("Code"),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              //the input
              controller: _codeController,
              //decoration
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  
                //greyed out text
                hintText: "Enter code..",
              ),
            ),
          ),

          Text("Description"),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              //the input
              controller: _descriptionController,
              //decoration
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  
                //greyed out text
                hintText: "Enter description..",
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/detailspage');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}