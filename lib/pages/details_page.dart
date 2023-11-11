// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  TextEditingController _codeController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final box = Hive.box();

  Future<bool> _onWillPop() async {

    _codeController.clear();
    _descriptionController.clear();

    Navigator.of(context).pushReplacementNamed('/homepage');
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
    
            List<String> employeeCodes = [_codeController.text, _descriptionController.text];
            List employeeList = box.get('codelist');
            employeeList.add(employeeCodes);
            box.put('codelist', employeeList);
            Navigator.pushNamed(context, '/homepage');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}