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
  List<bool> selected = [];

  @override
  void initState() {
    super.initState();

    if (box.get('codelist') == null) {
      box.put("codelist", [
        ['0','lorem ipsum']
      ]);
    }
  
    employeeList = box.get('codelist');
    selected = List<bool>.from(List<bool>.filled(employeeList.length, false));
  }

  void removeSelectedRows() {
  setState(() {
    var indicesToRemove = selected.asMap().entries.where((entry) => entry.value).map((entry) => entry.key).toList();
    indicesToRemove.sort((a, b) => b.compareTo(a)); // sort in descending order
    for (var index in indicesToRemove) {
      employeeList.removeAt(index);
      selected.removeAt(index);
    }
  });

  box.put('codelist', employeeList);
}

  Future<bool> _onWillPop() async {
    Navigator.of(context).pushReplacementNamed('/loginpage');
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                removeSelectedRows();
              },
              icon: Icon(Icons.remove),
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
              rows: employeeList.asMap().entries.map<DataRow>((entry) {
                int index = entry.key;
                var item = entry.value;
                return DataRow(
                  selected: selected[index],
                  onSelectChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        selected[index] = value;
                      });
                    }
                  },
                  cells: <DataCell>[
                    DataCell(Text(item[0])),
                    DataCell(Text(item[1])),
                  ],
                );
              }).toList(),
            ),
          )
        ),
    
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detailspage');
          },
          child: Icon(Icons.add),
        ),
    
      ),
    );
  }
}