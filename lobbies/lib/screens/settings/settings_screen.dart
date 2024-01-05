import 'package:flutter/material.dart';
import 'package:shop_app/screens/settings/components/settings_form.dart';
import 'package:shop_app/ThemeManager.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings";

  final ThemeManager themeManager; // Adicione esta linha

  SettingsScreen({required this.themeManager}); // Adicione este construtor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: SettingsForm(themeManager: themeManager), // Passe o themeManager para SettingsForm
    );
  }
}
