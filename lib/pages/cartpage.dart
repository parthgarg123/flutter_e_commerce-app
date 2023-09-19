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
      drawer: const MyDrawer(),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    num tot = Provider.of<CartData>(context).total;
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(context.theme.floatingActionButtonTheme.backgroundColor),
                      shape: const MaterialStatePropertyAll(StadiumBorder())
                    ), 
            child: "Buy".text.xl2.semiBold.make(),),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList();

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartData>(context).cart;
    if(cart.isEmpty){
      return'Add Something First !'.text.xl3.make().centered();
    }
    else{
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context,index)=>ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          onPressed: (){
            Provider.of<CartData>(context,listen: false).removeP(cart[index]);
            Provider.of<CartData>(context,listen: false).tot();
          },
          icon: const Icon(Icons.remove_circle_outline),),
          title: cart[index]['name'].toString().text.make(),
      )
      );}
  }
}