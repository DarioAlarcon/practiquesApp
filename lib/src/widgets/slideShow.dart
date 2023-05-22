import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
class SlidesShow extends StatelessWidget {

final List<Widget>slides;
final bool puntosarriba;
final Color colorPrim;
final Color colorSecu;

const SlidesShow({ 
  required this.slides,
  this.puntosarriba = false, 
  this.colorPrim = Colors.black, 
  this.colorSecu = Colors.grey,
  });


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
     child: SafeArea(
       child: Center(
            child:Builder(
              builder: (BuildContext context) {
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    Provider.of<_SlideshowModel>(context, listen: false).ColorPrimario = colorPrim;
    Provider.of<_SlideshowModel>(context, listen: false).Colorsecundario = colorSecu;
  });
  return _crearEstructuraSlideShow(puntosarriba: puntosarriba, slides: slides);
},
          ),
     ),
    ));
  }
}

// ignore: camel_case_types
class _crearEstructuraSlideShow extends StatelessWidget {
  const _crearEstructuraSlideShow({
    super.key,
    required this.puntosarriba,
    required this.slides,
  });

  final bool puntosarriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(this.puntosarriba) _Dots(this.slides.length, ),
        Expanded(
          child: _Slides( this.slides)),
        if(!this.puntosarriba) _Dots(this.slides.length, ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {

final int totalSlides;
_Dots(this.totalSlides, );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, 
        (index) => _Dot(index, )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
final int index;

  const _Dot(this.index,);

  @override
  Widget build(BuildContext context) {
    
// ignore: non_constant_identifier_names
final SlideshowModel = Provider.of<_SlideshowModel>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 15,
      height: 15,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (SlideshowModel.currentPage >= index - 0.5 && SlideshowModel.currentPage < index + 0.5)
        ? SlideshowModel.ColorPrimario : SlideshowModel.Colorsecundario,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

final List<Widget> slides;

_Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  
  final pageViewController = new PageController();
  
  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
    super.initState();
  }
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide( slide: slide,)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({ required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier{
  double _currentPage = 0;
  Color _colorPrimario = Colors.amberAccent;
  Color _colorSecundario = Colors.grey;

  double get currentPage => this._currentPage;
  set currentPage(double pagina){
    this._currentPage = pagina;
    notifyListeners();
  }

  Color get ColorPrimario => this._colorPrimario;
  set ColorPrimario(Color color){
    this._colorPrimario = color;
    
  }

  Color get Colorsecundario => this._colorSecundario;
  set Colorsecundario(Color color){
    this._colorSecundario = color;
  }}