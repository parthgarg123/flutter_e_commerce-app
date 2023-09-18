import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl4.make(),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          _cartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ],
      ),
    );
  }
}


class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    num tot = Provider.of<CartData>(context,listen: false).total();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          '\$$tot'.text.xl3.bold.color(context.theme.colorScheme.primary).make(),
          100.widthBox,
          SizedBox(
            height: 50,
            width: 88,
            child: ElevatedButton(
              onPressed: (){ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Center(child: 'Not Yet Supported!'.text.xl.make())));}, 
            child: "Buy".text.xl2.semiBold.make(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(context.theme.floatingActionButtonTheme.backgroundColor),
                      shape: MaterialStatePropertyAll(StadiumBorder())
                    ),),
          )
        ],
      ),
    );
  }
}

class _cartList extends StatefulWidget {
  const _cartList({super.key});

  @override
  State<_cartList> createState() => __cartListState();
}

class __cartListState extends State<_cartList> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartData>(context).cart;
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context,index)=>ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: (){
            Provider.of<CartData>(context,listen: false).removeP(cart[index]);
          },
          icon: Icon(Icons.remove_circle_outline),),
          title: cart[index]['name'].toString().text.make(),
      )
      );
  }
}