
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashProvider extends ChangeNotifier{

  static ChangeNotifierProvider get(context)=>ChangeNotifierProvider.value(value: context);
  int currentPage=0;
  void currentPageChange(value){
    currentPage=value;
    notifyListeners();

  }

}