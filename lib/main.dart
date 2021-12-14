import 'package:flutter/material.dart';
import 'view_surd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
        //changed from blue to green
        primarySwatch: Colors.green,
      ),
      home: const SurdoDIO(),
    );
  }
}
