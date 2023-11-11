// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final box = Hive.box();
  //get the list that specifies only lists that contains strings so in other words its a 2d array
  List employeeList = [];

  @override
  void initState() {
    super.initState();

    if (box.get('codelist') == null) {
      box.put("codelist", [
        ['8135163','uwu']
      ]);
    }
  
    employeeList = box.get('codelist');
    print(employeeList);
  }

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
              DataColumn(label: Text("code")),
              DataColumn(label: Text("description")),
            ],
            rows: employeeList.map<DataRow>((item) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(item[0])),
                  DataCell(Text(item[1])),
                ],
              );
            }).toList(),
          ),
        )
      ),
    );
  }
}