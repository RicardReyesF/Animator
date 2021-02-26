import 'package:animate_app/src/challege/Animator_page.dart';
import 'package:animate_app/src/pages/animator_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Animator',
      home: CuadradoPage()
    );
  }
}