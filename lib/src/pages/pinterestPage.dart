import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:udemypractiques/src/theme/theme_changer.dart';

import '../widgets/pinterestMenu.dart';
class pinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (_)=> _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            pinterestGrid(),
            _pinterestmenuLocation()
          ],
        ),
      ),
    );
  }
}

class _pinterestmenuLocation extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
  final widthPantalla = MediaQuery.of(context).size.width;
  
  final mostrar = Provider.of<_MenuModel>(context).mostrar;
  final appTheme = Provider.of<ThemeChanger>(context).currentTheme; 
  final appThemete = Provider.of<ThemeChanger>(context);
    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Align(
          child: pinterestMenu(
            mostrar: mostrar,
            backgroundColor: appTheme.scaffoldBackgroundColor,
            inactiveColor: (appThemete.darkTheme)? Colors.white : Colors.black ,
            activeColor: (appThemete.darkTheme)? Colors.amberAccent : Colors.amber, 
            items: [
                pinterestButton(icon: Icons.pie_chart,onPressed: (){ print('Icon pie_chart');}),
                pinterestButton(icon: Icons.search,onPressed: (){ print('Icon search');}),
                pinterestButton(icon: Icons.notifications,onPressed: (){ print('Icon notifications');}),
                pinterestButton(icon: Icons.supervised_user_circle,onPressed: (){ print('Icon supervised_user_circle');})
                   ],

          ),
        ),
      )
    );
  }
}

class pinterestGrid extends StatefulWidget {

  @override
  State<pinterestGrid> createState() => _pinterestGridState();
}

class _pinterestGridState extends State<pinterestGrid> {
final List items = List.generate(203, (index) => index);
ScrollController controller = new ScrollController();
double scrollAnterior = 0;
@override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 350){
        Provider.of<_MenuModel>(context,listen: false).mostrar = false;
      }else{
        Provider.of<_MenuModel>(context,listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;

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
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4, 
      itemCount: items.length,
      itemBuilder: (context, index) => _pinterestItem( index), 
      staggeredTileBuilder: (index) => 
      StaggeredTile.count(2, index.isEven ? 2.7 : 3.1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      );
  }
}

class _pinterestItem extends StatelessWidget {
  
  final int index;
  _pinterestItem(
      this.index
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{
  bool _mostrar = true;

  bool get mostrar => this._mostrar;
  set mostrar(bool valor){
    this._mostrar = valor;
    notifyListeners();
  } 
  
}