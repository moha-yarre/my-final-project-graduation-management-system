import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:graduation_projects/screens/searching.dart';

import 'loginscreen.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;

    var std11 = TextEditingController();
    var std22 = TextEditingController();
    var title = TextEditingController();
    var desc = TextEditingController();
    var phone = TextEditingController();

    var supervisors = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text(
            "Home page",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Asearach(),
                        ),
                      );
                    },
                    icon: Icon(Icons.search),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return loginpage();
                          },
                        ));
                      },
                      child: Icon(Icons.logout))
                ],
              ),
            )
          ],
        ),
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('assignproject').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Wax Baa qaldan");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Fadlan sug inyar');
              }
              final info = snapshot.data!.docs;
              final titleNames = [];
              var titleDesc = [];
              var IDs = [];
              var superVsor = [];
              var std1 = [];
              var std2 = [];
              var phonelist = [];

              for (var information in info) {
                var titleName = information.get('titleName');

                var titleDesription = information.get('titledesc');
                var supervis = information.get('supervisor');
                var st1 = information.get('student1');
                var st2 = information.get('student2');
                var phn = information.get('groupNum');

                IDs.add(information.id);
                // if()

                titleNames.add(titleName);
                titleDesc.add(titleDesription);
                superVsor.add(supervis);
                std1.add(st1);
                std2.add(st2);
                phonelist.add(phn);
                // foculty.add(fac);
                // batc.add(bat);
                // progr.add(prog);
                // startd.add(strtdat);
                // endd.add(endats);
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: titleNames.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      // color: Colors.white,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: ListTile(
                        // leading: CircleAvatar(
                        //   child: Text('$index'),
                        // ),
                        title: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Expanded(
                                  child: AlertDialog(
                                    // title: Text(titleNames[index]),

                                    // content: Text('GeeksforGeeks'),
                                    content: Column(
                                      children: [
                                        Column(
                                          children: [
                                            DataTable(
                                              columns: [
                                                DataColumn(
                                                    label: Text(
                                                  "${titleNames[index]}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn(label: Text("")),
                                                // DataColumn(label: Text("stname")),
                                                // DataColumn(label: Text("stname")),
                                                // DataColumn(label: Text("stname")),
                                              ],
                                              rows: [
                                                DataRow(
                                                  cells: [
                                                    DataCell(Center(
                                                      child: Text(
                                                        "student one",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    )),
                                                    DataCell(Text(
                                                      "${std1[index]}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ))
                                                  ],
                                                ),
                                                DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                      "student two",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataCell(Text(
                                                      "${std2[index]}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ))
                                                  ],
                                                ),
                                                DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                      "supervisor",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataCell(Text(
                                                      "${superVsor[index]}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ))
                                                  ],
                                                ),
                                                DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                      "title ",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataCell(Text(
                                                      "${titleNames[index]}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ))
                                                  ],
                                                ),
                                                DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                      "sdescription",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataCell(Text(
                                                      "${titleDesc[index]}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ))
                                                  ],
                                                ),
                                                DataRow(
                                                  cells: [
                                                    DataCell(Text("")),
                                                    DataCell(Text(""))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            '${titleNames[index]}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          '${titleDesc[index]}',
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  std11.text = std1[index];
                                  std22.text = std2[index];
                                  title.text = titleNames[index];
                                  desc.text = titleDesc[index];

                                  supervisors.text = superVsor[index];
                                });
                              },
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/loggo.png'),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
            },
          ),
        ),
      ),
    );
  }
}
