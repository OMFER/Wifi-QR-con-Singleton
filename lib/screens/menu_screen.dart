import 'package:flutter/material.dart';
import 'package:app_wifi/router/app_routes.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOption = AppRoutes.menuOptions;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menú'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(menuOption[index].icon),
                  title: Text(menuOption[index].name),
                  onTap: () =>
                      Navigator.pushNamed(context, menuOption[index].route),
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: menuOption.length
            )
          );
  }
}
