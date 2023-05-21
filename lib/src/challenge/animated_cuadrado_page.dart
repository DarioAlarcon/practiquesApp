import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: CuadradoAnimado(),
        ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  
  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> moverizquierda;
  late Animation<double> moverArriba;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    controller =  AnimationController(
    vsync: this, duration: Duration(milliseconds: 4000));
    
  moverDerecha = Tween(
  begin: 0.1, end: 100.0
  ).animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut)));

  moverizquierda = Tween(
  begin: 0.1, end: -100.0
  ).animate(CurvedAnimation(parent: controller, curve: Interval(0.50, 0.75, curve: Curves.bounceOut)));

  moverArriba = Tween(
  begin: 0.1, end: -100.0
  ).animate(CurvedAnimation(parent: controller, curve: Interval(0.25, 0.50, curve: Curves.bounceOut)));

  moverAbajo = Tween(
  begin: 0.1, end: 100.0
  ).animate(CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

  controller.addListener(() { 

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
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(), 
      builder: (context, childRectangle){
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.translate(
            offset: Offset(0.0, moverArriba.value),
            child: Transform.translate(
              offset: Offset(moverizquierda.value, 0),
              child: Transform.translate(
                offset: Offset(0, moverAbajo.value),
                child: childRectangle,),),),);
      });
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