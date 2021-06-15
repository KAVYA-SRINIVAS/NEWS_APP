import 'package:flutter/material.dart';
import 'package:newsapp/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
