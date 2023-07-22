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
            child: Image.network(items[index]['image']).box.p12.make().w40(context)),
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