// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

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
            child: UserAccountsDrawerHeader(accountName: Text('Parth',
              style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.amber,), 
              accountEmail: Text('Parthgarg@gmail.com',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assests/images/useraccount.JPG'),
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
    );
  }
}