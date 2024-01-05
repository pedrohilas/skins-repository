import 'package:flutter/material.dart';
import 'package:shop_app/screens/myaccount/components/myaccount_form.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/userProfile'; // Definindo o nome da rota

  final String userEmail;

  const UserProfileScreen({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: UserDetailsByEmailPage(userEmail),
    );
  }
}
