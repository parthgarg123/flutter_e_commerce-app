// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();
  MovetoHome(BuildContext context) async{
    if(_formkey.currentState!.validate()){
    setState(() {
      changeButton=true;
    });
    await Future.delayed(Duration(milliseconds: 350));
    Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton=false;
    });
  }}
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Image.asset('assests/images/login_img_yellow.png',fit: BoxFit.cover,),
                SizedBox(height: 20,),
                Text("First time? $name",style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),),
                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:16.0,horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "enter username",
                          labelText: "username",
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "username can't be empty";
                          }
                          else if(value.length<4){
                            return "length can't be less than 4";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        cursorColor: Colors.black,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "enter password",
                          labelText: "password"
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "password can't be empty";
                          }
                          else if(value.length<6){
                            return "length can't be less than 6";
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Material(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(changeButton?20:5),
                  child: InkWell(
                   
                    onTap:() => MovetoHome(context),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 40,
                      width: changeButton?60:120,
                      alignment: Alignment.center,
                      child: changeButton?Icon(Icons.done,color: Colors.black,):
                      Text('Log-In',style: TextStyle(
                        fontSize: 18,
                      ),),
                    ),
                  ),
                ),
                /* ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.homeRoute);}, 
                child: Text('Log-In',style: TextStyle(fontSize: 18),),
                style: TextButton.styleFrom(minimumSize: Size(120, 40)),) */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
