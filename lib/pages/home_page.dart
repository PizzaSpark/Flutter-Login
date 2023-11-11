// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<List<String>> employeeList = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.pushNamed(context, '/loginpage');
          },
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/detailspage');
            },
            icon: Icon(Icons.add),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: DataTable(
            showCheckboxColumn: true,
            columns: [
              DataColumn(label: Text("YES")),
              DataColumn(label: Text("YES")),
              DataColumn(label: Text("YES")),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text("uwu")),
                DataCell(Text("uwu")),
                DataCell(Text("uwu")),
              ]
              ),
        
              DataRow(cells: [
                DataCell(Text("uwu")),
                DataCell(Text("uwu")),
                DataCell(Text("uwu")),
              ]
              ),
            ],
          ),
        )
      ),
    );
  }
}