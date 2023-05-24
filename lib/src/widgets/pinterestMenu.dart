import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class pinterestButton{
  final VoidCallback onPressed;
  final IconData icon;

  pinterestButton({
    required this.onPressed, 
    required this.icon});

  
}

class pinterestMenu extends StatelessWidget {
  
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  pinterestMenu({ 
    this.mostrar = true,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    this.backgroundColor = Colors.white, 
    required this.items
    });
  

  final List<pinterestButton> items;


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(

        duration: Duration(milliseconds: 250),
        opacity: (mostrar) ? 1:0,
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
             Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
             Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            return _pinterestMenuBackground(
              _MenuItems( items)
              );
          }
        ),
      )
        );
  }
}

class _pinterestMenuBackground extends StatelessWidget {
  const _pinterestMenuBackground(this.child);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<pinterestButton> menuItems;
  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _pinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _pinterestMenuButton extends StatelessWidget {
  final int index;
  final pinterestButton item;

  const _pinterestMenuButton(this.index, this.item);
  
  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).intemSeleccionado;
    final menuModel =  Provider.of<_MenuModel>(context);

            
    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).intemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index)? 30:25,
          color: (itemSeleccionado == index)? menuModel.activeColor :menuModel.inactiveColor,
          ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  
  int _itemSeleccionado = 0;
   Color activeColor = Colors.black;
   Color inactiveColor = Colors.blueGrey;
   Color backgroundColor = Colors.white;

  int get intemSeleccionado => this._itemSeleccionado;

  set intemSeleccionado(int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }

}