import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/database_helper.dart';
import 'package:shop_app/user.dart';

class TelaMinhaConta extends StatefulWidget {
  final User newUser; // Adicione um objeto Usuario como parâmetro

  const TelaMinhaConta({Key? key, required this.newUser}) : super(key: key);

  @override
  _TelaMinhaContaState createState() => _TelaMinhaContaState();
}

class _TelaMinhaContaState extends State<TelaMinhaConta> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String lastname;
  late String PhoneNumber;
  late String address;
  

  @override
  void initState() {
    super.initState();
    // Inicialize os valores dos campos com os dados do usuário
    name = widget.newUser.name;
    lastname = widget.newUser.lastname;
    PhoneNumber = widget.newUser.PhoneNumber;
    address = widget.newUser.address;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Adicione TextFormFields para cada campo, inicializando
          // seu valor e configurando suas propriedades
          // Exemplo para o campo nome:
          TextFormField(
  initialValue: name,
  decoration: InputDecoration(labelText: "Nome"),
  // Configurações adicionais...
      
  
),
 

TextFormField(
  initialValue: lastname,
  decoration: InputDecoration(labelText: "Sobrenome"),
  // Configurações adicionais...
          
),
          // Repita para sobrenome, número de telefone e endereço
          // Botão ou ação para salvar as alterações, se necessário
        ],
      ),
    );
  }
}
