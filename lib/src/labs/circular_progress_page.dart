import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressBar extends StatefulWidget {

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> with SingleTickerProviderStateMixin{
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _controller.addListener(() {
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, _controller.value)!;
      });
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.amber,
        onPressed: (){
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 5;
          if(nuevoPorcentaje>100){
            nuevoPorcentaje=0;
            porcentaje=0;
          }
          _controller.forward(from: 0.0);
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          //color: Colors.redAccent,
          child: CustomPaint(
            painter: _MyRadialPainter(porcentaje),
          ),
        ),
      ),
    );
  }
}


class _MyRadialPainter extends CustomPainter {
  final porcentaje;
  _MyRadialPainter(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {
  
  //completeCircle
  final paint = new Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;


  Offset center= new Offset (size.width * 0.5, size.height * 0.5);
  double radio = min(size.width * 0.5, size.height * 0.5);

  canvas.drawCircle(center, radio, paint);
  
  //arco

  final paintArche = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.amber
      ..style       = PaintingStyle.stroke;

  //llenado
  double arcAngle = 2 * pi *(porcentaje/100);
  canvas.drawArc(
    Rect.fromCircle(center: center, radius: radio), 
    -pi/2, 
    arcAngle, 
    false, 
    paintArche);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}