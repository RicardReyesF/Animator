import 'package:animate_app/src/pages/animator_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Animatorpage()
    );
  }
}