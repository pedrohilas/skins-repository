import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/settings/settings_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(AppTheme.lightTheme), // Corrigido para inicializar sem context
      child: const MyApp(),
    ),
  );
}

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();  // Notifica os ouvintes sobre a mudança
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: themeNotifier.getTheme(), // Usa o tema do ThemeNotifier
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
