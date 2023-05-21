import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final Color colorPrim;
  final Color colorSecu;
  final double grosorsecu;
  final porcentaje;
  const RadialProgress({
    @required this.porcentaje, 
    this.colorPrim=Colors.black,  
    this.colorSecu=Colors.grey,  
    this.grosorsecu= 4.0});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late double porcentajeAnterior;
  
  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    _controller =  AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _controller.forward(from: 0.0);

    final diferenceAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter:_MyRadialPainter((widget.porcentaje-diferenceAnimar)+(diferenceAnimar*_controller.value),
          widget.colorPrim,
          widget.colorSecu,
          widget.grosorsecu
          ), 
          ),
      );
      },
    );
  }
}

class _MyRadialPainter extends CustomPainter {
  final porcentaje;
  final Color colorSecu;
  final Color colorPrim;
  final double grosorsecu;
  _MyRadialPainter(this.porcentaje, this.colorPrim, this.colorSecu, this.grosorsecu);
  @override
  void paint(Canvas canvas, Size size) {
  
  //completeCircle
  final paint = new Paint()
      ..strokeWidth = grosorsecu
      ..color       = colorSecu
      ..style       = PaintingStyle.stroke;


  Offset center= new Offset (size.width * 0.5, size.height * 0.5);
  double radio = min(size.width * 0.5, size.height * 0.5);

  canvas.drawCircle(center, radio, paint);
  
  //arco

  final paintArche = new Paint()
      ..strokeWidth = 10
      ..color       = colorPrim
      ..strokeCap = StrokeCap.round
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