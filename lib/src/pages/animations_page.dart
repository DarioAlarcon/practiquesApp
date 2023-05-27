import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

import '../theme/theme_changer.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

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

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{
  
  late AnimationController _conroller;
  late Animation<double> rotation;
  late Animation<double> opacidad;
  late Animation<double> moverDerecha;
  late Animation<double> escalar;

  @override
  void initState() {
    _conroller =  AnimationController(
    vsync: this, duration: Duration(milliseconds: 4000));
    
rotation = Tween(
  begin: 0.0, end: 2 * math.pi
).animate(
  CurvedAnimation(parent: _conroller, curve: Curves.bounceOut)
);

opacidad = Tween(
  begin: 0.1, end: 1.0
).animate(
  CurvedAnimation(parent: _conroller, curve: Interval(0, 0.25))

);

moverDerecha = Tween(
  begin: 0.1, end: 200.0
).animate(_conroller);

escalar = Tween(
  begin: 0.1, end: 2.0
).animate(
  CurvedAnimation(parent: _conroller, curve: Interval(0, 0.75))

);

  _conroller.addListener(() {
    if (_conroller.status==AnimationStatus.completed) {
      _conroller.reverse();
    }
  });
    super.initState();
  }

  @override
  void dispose() {
    _conroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _conroller.forward();
    return AnimatedBuilder(
      animation: _conroller ,
      child: _Rectangulo(),
      builder: (context, childRectagle) {
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacidad.value,
              child: Transform.scale(
                scale: escalar.value,
                child: childRectagle),)),
        );
      },);
  }
}






class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    final appThemete = Provider.of<ThemeChanger>(context);
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: (appThemete.darkTheme)? Colors.amberAccent:Colors.amber
       ),
     );
   }
}