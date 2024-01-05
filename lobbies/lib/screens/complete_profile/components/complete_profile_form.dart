import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_app/database_helper.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/user.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String name = '';
  String email = '';
  String password = '';
  String lastname = '';
  String PhoneNumber = '';
  String address = '';

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;


    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField( // Primeiro Nome
            onSaved: (newValue) => name = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField( // Ultimo Nome
            onSaved: (newValue) => lastname = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "First Name",
              hintText: "Enter your lastname",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField( // Telemovel
            keyboardType: TextInputType.number,
            onSaved: (newValue) => PhoneNumber = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "PhoneNumber",
              hintText: "Enter your PhoneNumber",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField( // Local
            onSaved: (newValue) => address = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "address",
              hintText: "Enter your address",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          FormError(errors: errors),
          const SizedBox(height: 20),


          ElevatedButton( // Register User
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                User newUser = arguments['newUser'];
                // Cria um objeto User
                newUser = User(
                  name: name,
                  email: newUser.email,
                  password: newUser.password,
                  lastname: lastname,
                  PhoneNumber: PhoneNumber,
                  address: address,
                );

                // Inserir user na base de dados
                DatabaseHelper.instance.insertUser(newUser);
                // Obter todos os usuários
                List<User> users = await DatabaseHelper.instance.users(newUser);

                for (var user in users) {
                  print(
                      'User: ${user.name}, LASTNAME: ${user.lastname},PhoneNumber: ${user.PhoneNumber}, ADDRESS: ${user.address}, Email: ${user.email}');
                }
                Navigator.pushNamed(
                  context,
                  SignInScreen.routeName,
                  arguments: {'newUser2': newUser},
                );                  




              }
            },
            child: const Text("Continue"),
          ),


        ],
      ),
    );
  }
}
