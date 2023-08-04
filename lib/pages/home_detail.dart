import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final List items;
  final int index;
  const HomeDetailPage({super.key, required this.items, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
        children: [
          Hero(
            tag: Key(items[index]['id'].toString()),
            child: Image.network(items[index]['image']).centered()).p12().h32(context),
            Expanded(child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                width: context.screenWidth,
                color: context.theme.colorScheme.onBackground,
                child: Column(
                  children: [
                    "${items[index]['name']}".text.color(context.theme.colorScheme.primary).xl4.bold.make().p4(),
                    "${items[index]['desc']}".text.color(context.theme.colorScheme.onPrimary).lg.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "Diam dolores ea tempor clita elitr. Kasd amet at ea lorem amet dolor sit. Sit sit amet sadipscing sed no stet sed sed, dolore elitr sit gubergren estinvidunt ut amet, eos sit sanctus et sed lorem et stet nonumy, duo sadipscingsea dolores eirmod duo rebum sit at ut"
                    .text.color(context.theme.colorScheme.onPrimary)
                    .textStyle(context.captionStyle).make().p16(),
                  ],
                ).py64(),
              ),))
        ],
      )),
      
      backgroundColor: MyTheme.cream,
      bottomNavigationBar: Container(
        color: context.canvasColor,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${items[index]['price']}".text.bold.xl4.make(),
                    ElevatedButton(onPressed: (){}, 
                    child: "Buy".text.color(context.theme.colorScheme.onPrimary).semiBold.xl2.make(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(context.theme.floatingActionButtonTheme.backgroundColor),
                      shape: MaterialStatePropertyAll(StadiumBorder()),
                    ),).wh(100, 50)
                  ],
                ).p32(),
      ),
      );
  }
}