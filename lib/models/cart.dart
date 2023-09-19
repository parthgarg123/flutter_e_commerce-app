import 'package:flutter/material.dart';
/*
class CartModel{
  static final cartModel = CartModel._internal();

  CartModel._internal();
  factory CartModel() => cartModel;

  final List<Map<dynamic,dynamic>> cartList=[];

  void add(Map<dynamic,dynamic> item, int index ) {
    print(item.runtimeType);
    //final dynamic data = item[index];
    cartList.add(item[index]);
  }

  void remove(List item, int index) {
    cartList.remove(item);
  }
  int len(){
    return cartList.length;
  }
  String data(){
    return 'k';
  }
}
*/
class CartData extends ChangeNotifier{
    final List<Map<String, dynamic>> cart=[];
    num total=0;
    void tot(){
      num sum=0;
      for(int i=0;i<cart.length;i++){
          sum+=cart[i]['price'];
      }
      total = sum;
      ChangeNotifier();
    }
    void addP(Map<String, dynamic> item){
        cart.add(item);
        notifyListeners();
    }
    void removeP(Map<String, dynamic> item){
      cart.remove(item);
      notifyListeners();
    }
    
}
