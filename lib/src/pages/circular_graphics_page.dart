import 'package:flutter/material.dart';

import '../widgets/radial_progress.dart';

class circularGraphics extends StatefulWidget {
  const circularGraphics ({super.key});

  @override
  State<circularGraphics> createState() => _circularGraphicsState();
}

class _circularGraphicsState extends State<circularGraphics> {
  double porcentaje=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed:(){
          setState(() {
            porcentaje += 10;
            if (porcentaje>100) {
              porcentaje = 0;
            }
          });
        } ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            customRadialProgress(porcentaje: porcentaje, colores: Colors.redAccent,),
            customRadialProgress(porcentaje: porcentaje, colores: Colors.blueAccent)
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            customRadialProgress(porcentaje: porcentaje, colores: Colors.yellowAccent,),
            customRadialProgress(porcentaje: porcentaje, colores: Colors.orangeAccent,)
          ],)
        ],
        )
    );
  }
}

class customRadialProgress extends StatelessWidget {
  const customRadialProgress({
    required this.porcentaje, required this.colores,
  });

  final double porcentaje;
  final Color colores;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      //color: Colors.amber,
      child: RadialProgress(porcentaje: porcentaje,
      colorPrim: colores,
      colorSecu: Colors.black,
      grosorsecu: 12.0,),
    );
  }
}