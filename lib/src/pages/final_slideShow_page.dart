
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemypractiques/src/theme/theme_changer.dart';
import 'package:udemypractiques/src/widgets/slideShow.dart';
import 'package:flutter_svg/svg.dart';
class SlidesShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if(MediaQuery.of(context).size.height>500){
      isLarge = true;
    }else{
      isLarge = false;
    }

    final children = [
        Expanded(child: miSlideShow()),
        Expanded(child: miSlideShow2()),
      ];

    return Scaffold(
      body: (isLarge)?
      Column(
        children: children,
      ):
      Row(children: children,)
    );
  }
}

class miSlideShow extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    
    return SlidesShow(
      colorPrim: Colors.amberAccent,
      colorSecu: Colors.grey,
      //puntosarriba: true,
      slides: [
        SvgPicture.asset('assets/svj/slide_1.svg'),
        SvgPicture.asset('assets/svj/slide_2.svg'),
        SvgPicture.asset('assets/svj/slide_3.svg'),
        SvgPicture.asset('assets/svj/slide_4.svg'),
        SvgPicture.asset('assets/svj/slide_5.svg'),
      ],
    );
  }
}
class miSlideShow2 extends StatelessWidget {
  const miSlideShow2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlidesShow(
       colorPrim: Colors.amberAccent,
      colorSecu: Colors.grey,
      puntosarriba: true,
      slides: [
        SvgPicture.asset('assets/svj/slide_1.svg'),
        SvgPicture.asset('assets/svj/slide_2.svg'),
        SvgPicture.asset('assets/svj/slide_3.svg'),
        SvgPicture.asset('assets/svj/slide_4.svg'),
        SvgPicture.asset('assets/svj/slide_5.svg'),
      ],
    );
  }
}