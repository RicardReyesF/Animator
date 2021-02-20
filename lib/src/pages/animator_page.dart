import 'package:flutter/material.dart';

class Animatorpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Rectangulo(),
      )
    );
  }
}
 
class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}