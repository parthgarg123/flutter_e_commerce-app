import 'package:flutter/material.dart';

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
    bool contains(dynamic item){
      ChangeNotifier();
      return cart.contains(item);
    }
    
}
