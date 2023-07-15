import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var raw_data = await rootBundle.loadString("assests/files/catalog.json");
    var f_data = jsonDecode(raw_data);
    var data = f_data['products'];
    print(data);
  }
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => item.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sasta Amazon"),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: /*item.products.length*/ dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(catalogs: /*item.products[index]*/ dummyList[index],);
            },
          ),
        ),
    drawer: MyDrawer(),
    );
  }
}