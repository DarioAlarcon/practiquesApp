import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:udemypractiques/src/models/layout_model.dart';
import 'package:udemypractiques/src/pages/launche_page.dart';
import 'package:udemypractiques/src/pages/launche_page_tablet.dart';
import 'package:udemypractiques/src/theme/theme_changer.dart';
void main() => runApp(
  MultiProvider(
    providers: [
        ChangeNotifierProvider( create: (_) => new ThemeChanger(2)),
        ChangeNotifierProvider( create: (_) => new LayoutModel()),
    ],
    child: MyApp()
    )
  );
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (context, orientation) {
        final screenSize = MediaQuery.of(context).size;

        if (screenSize.width>500) {
          return LaunchePageTablets();
        }else{
          return LaunchePage();
        }

      })
    );
  }
}