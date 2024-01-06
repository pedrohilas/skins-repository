import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/theme.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings";

  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLightTheme = true; // tema padrão é claro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      body: ListView(   
        children: [
          ListTile(
            title: Text(
              'Brilho',
               style: TextStyle(color: const Color.fromARGB(255, 61, 59, 59)), // Define a cor do texto para branco
),
            trailing: Icon(
              Icons.brightness_6,
              color: const Color.fromARGB(255, 40, 38, 38), // Define a cor do ícone para branco
              
              
              ),
            onTap: () {
    // Alternar tema
    ThemeManager.setTheme(
      context,  // Este é o BuildContext correto
      isLightTheme ? AppTheme.lightTheme : AppTheme.lightwhite,
    );
    setState(() {
      isLightTheme = !isLightTheme;
    });
  },
          ),
          // ... outros itens da lista
        ],
      ),
    );
  }
}

// Suponha que você tenha uma classe ThemeManager para gerenciar mudanças de tema

class ThemeManager {
  static void setTheme(BuildContext context, ThemeData themeData) {
    // Acessa o ThemeNotifier usando o Provider e define o novo tema
    var themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    themeNotifier.setTheme(themeData);
  }
}
