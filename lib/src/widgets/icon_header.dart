import 'package:flutter/material.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subTitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    required this.icon, 
    required this.titulo, 
    required this.subTitulo, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey
    });
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: Icon(
            this.icon,
            color: Colors.white.withOpacity(0.2),
            size: 250,

            )
        ),
        Column(
          children: [
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(this.subTitulo, 
            style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(this.titulo, 
            style: TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
            this.icon,
            color: Colors.white,
            size: 80,

            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  
  final Color color1;
  final Color color2;
  const _IconHeaderBackground({
   required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        //color: Colors.amberAccent,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2,
          ])
      ),
    );
  }
}