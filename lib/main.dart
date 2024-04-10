import 'package:app_wifi/providers/testprovider.dart';
import 'package:app_wifi/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:app_wifi/router/app_routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TestProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Wifi',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        theme: AppTheme.tema,
        //onGenerateRoute: AppRoutes,onGenerateRoutes ,
      ),
    );
  }
}
