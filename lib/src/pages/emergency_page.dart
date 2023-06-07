import 'package:flutter/material.dart';
import 'package:udemypractiques/src/widgets/botonIconGradient.dart';

import '../widgets/icon_header.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}



class emergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    bool isLarge;
    if(MediaQuery.of(context).size.height>550){
      isLarge = true;
    }else{
      isLarge = false;
    }

    final items = <ItemBoton>[
  new ItemBoton( Icons.car_crash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
  new ItemBoton( Icons.add, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
  new ItemBoton( Icons.theater_comedy_outlined, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
  new ItemBoton( Icons.broken_image, 'Awards', Color(0xff317183), Color(0xff46997D) ),
  new ItemBoton( Icons.car_crash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
  new ItemBoton( Icons.add, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
  new ItemBoton( Icons.theater_comedy_outlined, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
  new ItemBoton( Icons.broken_image, 'Awards', Color(0xff317183), Color(0xff46997D) ),
  new ItemBoton( Icons.car_crash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
  new ItemBoton( Icons.add, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
  new ItemBoton( Icons.theater_comedy_outlined, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
  new ItemBoton( Icons.broken_image, 'Awards', Color(0xff317183), Color(0xff46997D) ),
];

List<Widget> itemMap = items.map(
  (item) => botonIconGra(
    texto: item.texto, 
    onPress: (){},
    color1: item.color1,
    color2: item.color2,
    icon: item.icon,
    )
).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: (isLarge)? 290:10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ...itemMap
              ],

          
            ),
          ),
          if(isLarge)
          _encabezado(),
        ],
      )
    );
  }
}

class _encabezado extends StatelessWidget {
  const _encabezado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: Icons.add, 
          titulo: 'ASISTENCIA MEDICA', 
          subTitulo: 'haz solicitado',
          color1: Color(0xff536CF6),
          color2: Color(0xff66A9F2),),
          Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              onPressed: (){},
              shape: CircleBorder(),
              child: Icon(Icons.more_vert, color: Colors.white,)
              )
              )
      ],
    );
  }
}

class botonIcongra_temp extends StatelessWidget {
  const botonIcongra_temp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return botonIconGra(
    texto: 'textico',
    onPress: (){},
    color2: Colors.redAccent,
    color1: Colors.yellowAccent,
    icon: Icons.car_crash,
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconHeader(icon: Icons.add, 
    subTitulo: 'hola', 
    titulo: 'title',
    color1: Color(0xff526bf6),
    color2: Color(0xff67acf2),

    );
  }
}