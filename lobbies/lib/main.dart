import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'routes.dart';
import 'database_helper.dart';
import 'ThemeManager.dart';

void main() {
  final themeManager = ThemeManager(); // Crie uma instância de ThemeManager

  runApp(MyApp(
    themeManager: themeManager,
    appRoutes: routes(themeManager), // Passe as rotas resultantes da função routes
  ));
}

class MyApp extends StatelessWidget {
  final ThemeManager themeManager;
  final Map<String, WidgetBuilder> appRoutes; // Adicione esta linha

  const MyApp({
    Key? key,
    required this.themeManager,
    required this.appRoutes, // Corrija o construtor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: themeManager.currentTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: appRoutes, // Use as rotas passadas como argumento
    );
  }
}
