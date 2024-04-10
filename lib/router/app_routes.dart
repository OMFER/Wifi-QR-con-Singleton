import 'package:flutter/material.dart';
import 'package:app_wifi/models/menu_option.dart';
import 'package:app_wifi/screens/screens.dart';

class AppRoutes{
  static const initialRoute = 'menu';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'wifi', name: 'Wifi', screen: WifiScreen(), icon: Icons.wifi_outlined),
    MenuOption(route: 'qr', name: 'Qr', screen:const QrScreen(), icon: Icons.qr_code_2_outlined),
    MenuOption(route: 'apn', name: 'Apn', screen: const ApnScreen(), icon: Icons.tap_and_play_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {

    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'menu' : (BuildContext context) =>const MenuScreen()});

      for (final option in menuOptions){
        appRoutes.addAll({
          option.route : (BuildContext context) => option.screen,
          });
      }
 
    return appRoutes;
  }
  /*static Route<dynamic> onGenerateRoute (RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
      );
  }*/
}