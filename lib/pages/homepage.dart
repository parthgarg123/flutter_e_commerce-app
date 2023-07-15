// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


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
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.cream,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              FutureBuilder(
                future: loadData(),
                builder: (context,data){
                  if(_items.isNotEmpty)
                    return CatalogList(items: _items).expand();
                  else
                    return Center(
                  child: CircularProgressIndicator(),
                );
                })
          ]),
        ),
      ),
    );
  }


}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Sasta Amazon'.text.xl5.bold.color(Colors.black).make(),
              'Trending'.text.xl2.color(Colors.black).make(),
              Padding(padding: EdgeInsets.only(bottom: 8.0))
          ]);
  }
}

class CatalogList extends StatelessWidget {
  final List items;
  const CatalogList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length ,
      itemBuilder: (context,index){
        return CatalogItem(items: items,index: index);
      });
  }
}


class CatalogItem extends StatelessWidget {
  final List items;
  final int index;
  const CatalogItem({super.key, required this.items, required this.index});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Image.network(items[index]['image']).box.p12.make().w40(context),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "${items[index]['name']}".text.lg.bold.make().p4(),
              "${items[index]['desc']}".text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${items[index]['price']}".text.bold.xl.make(),
                  ElevatedButton(onPressed: (){}, child: "Buy".text.make(),
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(StadiumBorder())
                  ),)
                ],
              ).pOnly(right: 16)
            ],
          ))
        ],
      )
    ).white.rounded.square(120).make().py16();
}
}