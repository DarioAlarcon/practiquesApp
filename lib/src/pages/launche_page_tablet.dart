import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemypractiques/src/models/layout_model.dart';
//import 'package:udemypractiques/src/labs/slideShow_page_lab.dart';
import 'package:udemypractiques/src/routes/routes.dart';
import 'package:udemypractiques/src/theme/theme_changer.dart';

import 'final_slideShow_page.dart';
class LaunchePageTablets extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños el Flutter, tablet'),
        backgroundColor: Colors.amber,
      ),
      drawer: _menuprincipal(),
      body: Row(
        children: [
          Container(
            width: 350,
            height: double.infinity,
            child: _ListaOpciones()),
          Container(
            height: double.infinity,
            width: 1,
            decoration: const BoxDecoration(
              color: Colors.grey
            ),
          ),
          Expanded(
            child: layoutModel.currentPage
          )
        ],
      ),
    );
  }
}
class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Icon(PageRoutes[index].icon, color: Colors.amberAccent,),
        title: Text(PageRoutes[index].titulo),
        trailing: Icon(Icons.chevron_right, color: Colors.amber,),
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>PageRoutes[index].page));
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = PageRoutes[index].page;
        },
      ), 
      itemCount: PageRoutes.length, 
      separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.amber,),
    );
  }
}

class _menuprincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  child: Text('DA', style: TextStyle(
                    fontSize: 50,
                    color: Colors.white
                  ),),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones()
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.amber,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme, 
                onChanged: (value){
                  appTheme.darkTheme = value;
                },
                activeColor: Colors.white,
                activeTrackColor: Colors.amberAccent,),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: Colors.amber,),
                title: Text('custom theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme, 
                  onChanged: (value){
                    appTheme.customTheme = value;
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.amberAccent,),
              ),
            )
          ],
        ),
      ),
    );
  }
}