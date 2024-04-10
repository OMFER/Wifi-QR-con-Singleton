import 'package:flutter/material.dart';

class ApnScreen extends StatelessWidget {
   
  const ApnScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('APN'),
      ),
      body: const Center(
         child: Text('ApnScreen'),
      ),
    );
  }
}