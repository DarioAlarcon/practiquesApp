import 'package:flutter/material.dart';
import 'package:udemypractiques/src/challenge/animated_cuadrado_page.dart';
import 'package:udemypractiques/src/pages/circular_graphics_page.dart';
import 'package:udemypractiques/src/pages/emergency_page.dart';
import 'package:udemypractiques/src/pages/headers_page.dart';
import 'package:udemypractiques/src/pages/pinterestPage.dart';
import 'package:udemypractiques/src/pages/sliver_list_page.dart';

import '../pages/final_slideShow_page.dart';


final PageRoutes = [
  _route(Icons.slideshow, 'slide show', SlidesShowPage()),
  _route(Icons.emergency, 'emergency', emergencyPage()),
  _route(Icons.headset_rounded, 'headers', HeadersPage()),
  _route(Icons.nature_people, 'Animated rectangle', CuadradoAnimadoPage()),
  _route(Icons.circle_rounded, 'progress bar',circularGraphics()),
  _route(Icons.arrow_downward, 'pinterest', pinterestPage()),
  _route(Icons.mobile_off, 'slivers', SliverListaPage())
];



class _route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _route(this.icon, this.titulo, this.page);   
}