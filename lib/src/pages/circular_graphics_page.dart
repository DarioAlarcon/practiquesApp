import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_changer.dart';
import '../widgets/radial_progress.dart';

class circularGraphics extends StatefulWidget {
 
  @override
  State<circularGraphics> createState() => _circularGraphicsState();
}

class _circularGraphicsState extends State<circularGraphics> {
  double porcentaje=0.0;
  @override
  Widget build(BuildContext context) {
    final appThemete = Provider.of<ThemeChanger>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: (appThemete.darkTheme)? Colors.amberAccent: Colors.amber,
        child: Icon(
          Icons.refresh,
          color: (appThemete.darkTheme)?Colors.black: Colors.white,
          ),
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
            customRadialProgress(porcentaje: porcentaje*0.4, colores: Colors.deepPurpleAccent,),
            customRadialProgress(porcentaje: porcentaje, colores: Colors.blueAccent)
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            customRadialProgress(porcentaje: porcentaje*0.6, colores: Colors.redAccent,),
            customRadialProgress(porcentaje: porcentaje*0.2, colores: Colors.orangeAccent,)
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
    final appThemete = Provider.of<ThemeChanger>(context);
    return Container(
      width: 200,
      height: 200,
      //color: Colors.amber,
      child: RadialProgress(porcentaje: porcentaje,
      colorPrim: colores,
      colorSecu: (appThemete.darkTheme)? Colors.white:Colors.black,
      grosorsecu: 12.0,),
    );
  }
}