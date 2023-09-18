// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/pages/cartpage.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';

import 'package:provider/provider.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartData(),
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.homeRoute,
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => LoginPage(),
          MyRoutes.homeRoute:(context) => Homepage(),
          MyRoutes.loginRoute:(context) => LoginPage(),
          MyRoutes.cartRoute:(context) => MyCart(),
        },
      ),
    );
  }
  }
