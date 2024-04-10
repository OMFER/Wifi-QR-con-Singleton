import 'package:app_wifi/screens/singletonExample.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    final hola =NumberSingletonLazy();
    _render(){
      setState(() {
        
      });
    }
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: hola.renderState(_render), child: Text("hola"))
        ],
      ),
    );
  }
}