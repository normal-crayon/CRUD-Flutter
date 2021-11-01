import 'package:flutter/material.dart';
import 'package:cloud_data/database/database.dart';
import 'package:cloud_data/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.connect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // ),
    );
  }
}
