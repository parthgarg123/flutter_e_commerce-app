// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(accountName: Text('Username',
              style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Color(0xFFFFC107),), 
              accountEmail: Text('XXXXXXXXX@gmail.com',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assests/images/user_icon.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home,
            color: Colors.white,),
            title: Text('Home',
            textScaleFactor: 1.2,
            style: TextStyle(
              color: Colors.white,
            ),),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled,
            color: Colors.white,),
            title: Text('Profile',
            textScaleFactor: 1.2,
            style: TextStyle(
              color: Colors.white,
            ),),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail,
            color: Colors.white,),
            title: Text('Mail',
            textScaleFactor: 1.2,
            style: TextStyle(
              color: Colors.white,
            ),),
          ),
        ],
      ),
    ).wTwoThird(context);
  }
}