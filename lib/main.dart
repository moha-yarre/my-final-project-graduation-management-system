import 'package:flutter/material.dart';
import 'package:graduation_projects/adminpases/adding_project.dart';
import 'package:graduation_projects/adminpases/adminpage.dart';
import 'package:graduation_projects/adminpases/table.dart';
import 'package:graduation_projects/screens/homepage.dart';
import 'package:graduation_projects/screens/loginscreen.dart';
// import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // RenderNestedScrollViewViewpor
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: adminpage(),
    );
  }
}
