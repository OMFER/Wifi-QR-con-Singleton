import 'package:flutter/material.dart';

class TestProvider extends ChangeNotifier{

  bool _isOscured = true;

  set isOscured (bool value){
    _isOscured=value;
    notifyListeners();
  }
  bool get isOscured => _isOscured; 

}