import 'package:flutter/material.dart';
import 'package:udemypractiques/src/widgets/slideShow.dart';
import 'package:flutter_svg/svg.dart';
class SlidesShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: miSlideShow()),
        Expanded(child: miSlideShow2()),

      ],)
    );
  }
}

class miSlideShow extends StatelessWidget {
  const miSlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      colorPrim: Colors.redAccent,
      colorSecu: Colors.lightBlueAccent,
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