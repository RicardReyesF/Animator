import 'package:flutter/material.dart';

class CuadradoPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CudradoAnimado()
      )
    );
  }
}

class CudradoAnimado extends StatefulWidget {

  @override
  _CudradoAnimadoState createState() => _CudradoAnimadoState();
}

class _CudradoAnimadoState extends State<CudradoAnimado> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  @override
  void initState() {

    controller=new AnimationController(vsync: this,duration: Duration(milliseconds:4000)
    );

    moverDerecha=Tween(begin: 0.0,end: 100.0).animate(
      CurvedAnimation( parent: controller,curve: Interval( 0.0,0.25,curve: Curves.bounceOut))
    );

    moverArriba=Tween(begin: 0.0,end: -100.0).animate(
      CurvedAnimation(parent: controller,curve: Interval( 0.25,0.50,curve: Curves.bounceOut))
    );

    moverIzquierda=Tween(begin: 0.0,end: -100.0).animate(
      CurvedAnimation( parent: controller,curve: Interval( 0.50,0.75,curve: Curves.bounceOut))
    );

    moverAbajo=Tween(begin: 0.0,end: 100.0).animate(
      CurvedAnimation(parent: controller,curve: Interval( 0.75,1.0,curve: Curves.bounceOut))
    );
    
    
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child:_Rectangulo(),
      builder:(BuildContext context,Widget child){
        return Transform.translate(
        offset: Offset(moverDerecha.value,moverArriba.value),
        child:  Transform.translate(
          offset: Offset(moverIzquierda.value,moverAbajo.value),
          child: child
          )
        );
      }          
      
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
