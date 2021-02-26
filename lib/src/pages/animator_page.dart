import 'package:flutter/material.dart';
import 'dart:math';

class Animatorpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      )
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation <double> rotacion;
  Animation <double> opacidad;
  Animation <double> moverDerecha;
  Animation <double> agrandar;
  Animation <double> opacidadOut;

  @override
  void initState() {
    
    controller= new AnimationController(
      vsync: this,duration: Duration(milliseconds: 4000)
    );

    rotacion=Tween(begin:0.0,end:2.0*pi).animate(
      CurvedAnimation(parent: controller,curve: Curves.easeOut)
    );

    opacidad=Tween(begin:0.1,end:1.0).animate(CurvedAnimation(
      parent: controller,curve: Interval(0.0,0.25,curve: Curves.easeOut)
    ));

    moverDerecha=Tween(begin: 0.0,end: 150.0).animate(controller);

    agrandar=Tween(begin: 0.0,end: 2.0).animate(controller);

    opacidadOut=Tween(begin:1.0,end:0.0).animate(CurvedAnimation(
      parent: controller,curve: Interval(0.75,1.0,curve: Curves.easeOut)
    ));
  
     //status de una animacion
    // print("${agrandar.status}");  
    controller.addListener(() {
      if(controller.status==AnimationStatus.completed){
        //controller.reverse();
      }
     });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    //se considera boton de play
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value,0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value,
              child: Opacity(
                opacity: opacidadOut.value,
                child: Transform.scale(
                  scale: agrandar.value,
                  child: child,
                ),
              )
            ),
            
          ),
        );
      },
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