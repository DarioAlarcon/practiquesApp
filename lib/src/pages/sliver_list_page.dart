import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_changer.dart';

class SliverListaPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          _MainScroll(),
          Positioned(bottom: 0, right: 0, child: _bottomNewList()),
          
        ],
      )
    );
     }
}

class _bottomNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
        height: 100,
        minWidth: size.width * 0.9,
        child: ElevatedButton(onPressed: (){},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50)), // Cambia el radio de la esquina para ajustar la forma
      ),
    ),
        ),
        child: Container(
          height: 100,
          width: size.width * 0.8,
          alignment: Alignment.center,
          child: Text('CREATE NEW LIST', style: 
          TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
          ),
        )
        ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _listItem( 'Orange', Color.fromARGB(255, 255, 216, 75) ),
    _listItem( 'Family', Color.fromARGB(255, 255, 221, 99) ),
    _listItem( 'Subscriptions', Color.fromARGB(255, 252, 226, 134) ),
    _listItem( 'Books', Color(0xffFCEBAF) ),
    _listItem( 'Orange', Color.fromARGB(255, 255, 216, 75) ),
    _listItem( 'Family', Color.fromARGB(255, 255, 221, 99) ),
    _listItem( 'Subscriptions', Color.fromARGB(255, 252, 226, 134) ),
    _listItem( 'Books', Color(0xffFCEBAF) ),
  ];
  @override
  Widget build(BuildContext context) {
    final appThemete = Provider.of<ThemeChanger>(context);
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _sliverCustomHeader(
            190, 
            200,
            Container(
              child: _titulo(), 
              color: appThemete.currentTheme.scaffoldBackgroundColor,
              alignment: Alignment.centerLeft,)
          )),
        SliverList(delegate: SliverChildListDelegate([...items, SizedBox(height: 100,)]))
      ],
    );
  }
}

class _sliverCustomHeader extends SliverPersistentHeaderDelegate{
  final double minheight;
  final double maxheight;
  final Widget child;

  _sliverCustomHeader(
   @required this.minheight, 
   @required this.maxheight, 
   @required this.child);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _sliverCustomHeader oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
           minheight != oldDelegate.minheight ||
           child     != oldDelegate.child;
  }

}

class _titulo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final appThemete = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('NEW', 
          style: TextStyle(
            color:(appThemete.darkTheme)? Colors.white: Colors.brown, 
            fontSize: 50, 
            fontWeight: FontWeight.bold),),
        ),
        Stack(
          children: [
             Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: Color(0xfff7cdd5),
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(color: Colors.amber,fontSize: 50, fontWeight: FontWeight.bold),),
            ),
           
          ],
        )
      ],
    );
  }
}

class _listaTareas extends StatelessWidget {

   final items = [
    _listItem( 'Orange', Color(0xffF08F66) ),
    _listItem( 'Family', Color(0xffF2A38A) ),
    _listItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _listItem( 'Books', Color(0xffFCEBAF) ),
    _listItem( 'Orange', Color(0xffF08F66) ),
    _listItem( 'Family', Color(0xffF2A38A) ),
    _listItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _listItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _listItem extends StatelessWidget {
  final String titulo;
  final Color color;
  
  const _listItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appThemete = Provider.of<ThemeChanger>(context);
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      child: Text(
        this.titulo, 
        style: TextStyle(
          color: appThemete.currentTheme.scaffoldBackgroundColor, 
          fontSize: 20, 
          fontWeight: FontWeight.bold),),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
      color: this.color,
      borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}