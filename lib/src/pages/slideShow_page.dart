import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SlideShowPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: _Slides()),
            _Dots()
          ],
        ),
      )
    );
  }
}

class _Dots extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(),
          _Dot(),
          _Dot()
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {




  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  
  final pageViewController = new PageController();
  
  @override
  void initState() {
    pageViewController.addListener(() {
      
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
        children: [
          _Slide( svg: 'assets/svj/slide_1.svg',),
          _Slide( svg: 'assets/svj/slide_2.svg',),
          _Slide( svg: 'assets/svj/slide_3.svg',),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  const _Slide({ required this.svg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}