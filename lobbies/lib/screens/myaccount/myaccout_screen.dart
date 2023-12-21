import 'package:flutter/material.dart';
import 'package:shop_app/screens/myaccount/components/myaccount_form.dart';
import 'package:shop_app/user.dart';

class MyAccountScreen extends StatelessWidget {
  static const routeName = '/myAccountScreen';

  const MyAccountScreen({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      
      ),
    );
  }
}
