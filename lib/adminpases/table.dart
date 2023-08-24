import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class table extends StatefulWidget {
  const table({super.key});

  @override
  State<table> createState() => _tableState();
}

class _tableState extends State<table> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          centerTitle: true,
          title: Text("table",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(
                  width: 61,
                  // height: 400,
                ),
                // Padding(padding: EdgeInsets.),
                Column(
                  children: [
                    DataTable(
                      columns: [
                        DataColumn(
                            label: Text(
                          "name",
                          style: TextStyle(fontSize: 13),
                        )),
                        DataColumn(
                            label: Text(
                          "activity",
                          style: TextStyle(fontSize: 13),
                        )),
                        DataColumn(
                            label: Text(
                          "midtearm",
                          style: TextStyle(fontSize: 13),
                        )),
                        DataColumn(
                            label: Text(
                          "final",
                          style: TextStyle(fontSize: 13),
                        )),
                        DataColumn(
                            label: Text(
                          "Total",
                          style: TextStyle(fontSize: 13),
                        )),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(Text("moha")),
                            DataCell(Text("30")),
                            DataCell(Text("30")),
                            DataCell(Text("40")),
                            DataCell(Text("10"))
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
