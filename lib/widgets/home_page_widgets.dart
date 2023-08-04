import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_detail.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Sasta Amazon'.text.color(context.theme.colorScheme.primary).xl5.bold.make(),
              'Trending'.text.xl2.color(context.theme.colorScheme.primary).make(),
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
        return InkWell(
          onTap:() => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=>HomeDetailPage(
                items: items, index: index),),),
          child: CatalogItem(items: items,index: index));
       
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
          Hero(
            tag: Key(items[index]['id'].toString()),
            child: Image.network(items[index]['image']).box.p12.make().w32(context)),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "${items[index]['name']}".text.color(context.theme.colorScheme.secondary).lg.bold.make().p4(),
              "${items[index]['desc']}".text.color(context.theme.colorScheme.secondary).textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${items[index]['price']}".text.bold.color(context.theme.colorScheme.secondary).xl.make(),
                  ElevatedButton(onPressed: (){}, child: "Buy".text.make(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(context.theme.floatingActionButtonTheme.backgroundColor),
                    shape: MaterialStatePropertyAll(StadiumBorder())
                  ),)
                ],
              ).pOnly(right: 16)
            ],
          ))
        ],
      )
    ).color(context.theme.colorScheme.background).rounded.square(120).make().py16();
}
}