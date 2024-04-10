import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData tema = ThemeData.light().copyWith(
      inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)),
    ),
  ));
}
