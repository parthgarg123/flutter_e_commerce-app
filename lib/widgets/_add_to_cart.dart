// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class addToCart extends StatefulWidget {
  final Map<String,dynamic> items;
  const addToCart({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<addToCart> createState() =>  addToCartState();
}
class addToCartState extends State<addToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Provider.of<CartData>(context,listen: false).addP(widget.items);
      //final CartData _cart = CartData(); 
      setState(() {
        isAdded=isAdded.toggle();
      });
    }, child: isAdded?Icon(Icons.done):"Buy".text.make(),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(context.theme.floatingActionButtonTheme.backgroundColor),
      shape: MaterialStatePropertyAll(StadiumBorder())
    ),);
  }
}