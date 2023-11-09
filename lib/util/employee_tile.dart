// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class EmployeeTile extends StatelessWidget {
  const EmployeeTile({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: DataTable(
        columns: [
          DataColumn(label: Text('')),
          DataColumn(label: Text('Code Number')),
          DataColumn(label: Text('Name')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Checkbox(value: false, onChanged: (bool? value) {  },)),
            DataCell(Text('0545100154')),
            DataCell(Text('Lorem Ipsum')),
          ]),
          DataRow(cells: [
            DataCell(Checkbox(value: false, onChanged: (bool? value) {  },)),
            DataCell(Text('0545100155')),
            DataCell(Text('Dolor Sit Amet')),
          ]),
          DataRow(cells: [
            DataCell(Checkbox(value: false, onChanged: (bool? value) {  },)),
            DataCell(Text('0545100156')),
            DataCell(Text('Consectetur Adipiscing Elit')),
          ]),
        ],
      ),
    );
  }
}