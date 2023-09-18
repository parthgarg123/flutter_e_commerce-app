// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import '../widgets/home_page_widgets.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {

    List _items=[];

    Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final String rawData = await rootBundle.loadString("assests/files/catalog.json");
    final fData = await json.decode(rawData);
    setState(() {
      _items=fData['products'];
    });
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: MyDrawer(),
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.pushNamed(context, MyRoutes.cartRoute);},
        child: Icon(CupertinoIcons.cart),
        backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            IconButton(onPressed: (){
              _globalKey.currentState?.openDrawer();
            },
             icon: Icon(Icons.menu),
             padding: EdgeInsets.only(top: 48,left: 20),),
            Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                FutureBuilder(
                  future: loadData(),
                  builder: (context,data){
                    if(_items.isNotEmpty) {
                      return CatalogList(items: _items).py16().expand();
                    } else
                      return CircularProgressIndicator().centered().expand();
                  })
            ]),
          ),]
        ),
      ),
    );
  }


}