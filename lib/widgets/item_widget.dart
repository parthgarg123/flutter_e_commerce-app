import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';


class ItemWidget extends StatelessWidget {
  final catalog catalogs;

  const ItemWidget({super.key, required this.catalogs});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(catalogs.image),
        title: Text(catalogs.name),
        subtitle: Text(catalogs.desc),
        trailing: Text("\$${catalogs.price}",
        style: TextStyle(color: Colors.black),
        textScaleFactor: 1.4,),
        
      ),
    );
  }
}