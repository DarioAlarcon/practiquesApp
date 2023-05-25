import 'package:flutter/material.dart';

class botonIconGra extends StatelessWidget {
  
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const botonIconGra({
    this.icon = Icons.abc, 
    required this.texto, 
    this.color1 = Colors.purple, 
    this.color2 = Colors.blue, 
    required this.onPress
    });  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _botonIconBackground( color1: this.color1,color2: this.color2, icon: this.icon,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140, width: 40,),
            Icon(this.icon, color: Colors.white, size: 40),
            SizedBox( width: 20,),
            Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 18),)),
            Icon(Icons.arrow_right, color: Colors.white,),
            SizedBox( width: 40,),
          ],
        )
      ],
    );
  }
}

class _botonIconBackground extends StatelessWidget {
  
  final IconData icon;
  final Color color1;
  final Color color2;

  const _botonIconBackground({required this.icon, required this.color1, required this.color2});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Icon(this.icon,
              size: 150,
              color: Colors.white.withOpacity(0.2),
              )
              )
          ],
        ),
      ),  




      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
      //color: Colors.amberAccent,
      boxShadow: [
        BoxShadow( color: Colors.black.withOpacity(0.2), offset: Offset(4,6), blurRadius: 10)
      ],
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(colors: [
        this.color1,
        this.color2
      ])

      ),
    );
  }
}