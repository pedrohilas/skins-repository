import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/ThemeManager.dart';

class SettingsForm extends StatefulWidget {
  final ThemeManager themeManager;

  SettingsForm({required this.themeManager});

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.themeManager.toggleTheme();
              // Atualize o tema do aplicativo
              if (widget.themeManager.themeMode == ThemeMode.light) {
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
              } else {
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
              }
            });
          },
          child: Text('Mudar Tema'),
        ),
        // Outros elementos do formulário de configurações
      ],
    );
  }
}
