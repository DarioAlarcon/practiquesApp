import 'package:flutter/material.dart';
import 'package:udemypractiques/src/pages/final_slideShow_page.dart';

class LayoutModel with ChangeNotifier{

Widget _currentPage = SlidesShowPage();

set currentPage(Widget page){
  this._currentPage = page;
  notifyListeners();
}

Widget get currentPage => this._currentPage;

}