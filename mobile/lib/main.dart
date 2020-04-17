import 'package:flutter/material.dart';
import 'package:mobile/src/home_page.dart';
import 'package:mobile/utils/theme.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watches Shop',
      theme: buildThemeData(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}