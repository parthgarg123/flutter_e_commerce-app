import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';


class ItemWidget extends StatelessWidget {
  final List items;

  const ItemWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading: Image.network(items[index]['image']),
                    title: Text(items[index]['name']),
                    subtitle: Text(items[index]['desc']),
                    trailing: Text("\$${items[index]['price']}",
                    style: TextStyle(color: Colors.black),
                    textScaleFactor: 1.4,),
                    contentPadding: EdgeInsets.all(12),
                  ),
                );
            },);
  }
}