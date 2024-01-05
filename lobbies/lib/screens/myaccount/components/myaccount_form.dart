import 'package:flutter/material.dart';
import 'package:shop_app/database_helper.dart';
import 'package:shop_app/user.dart';

class UserDetailsByEmailPage extends StatefulWidget {
  final String userEmail;

  const UserDetailsByEmailPage(this.userEmail, {Key? key}) : super(key: key);

  @override
  _UserDetailsByEmailPageState createState() => _UserDetailsByEmailPageState();
}

class _UserDetailsByEmailPageState extends State<UserDetailsByEmailPage> {
  late Future<User?> _userFuture; // Futuro para armazenar o resultado de getUserByEmail

  @override
  void initState() {
    super.initState();
    // Inicializando o Future no início do ciclo de vida do estado
    _userFuture = DatabaseHelper.instance.getUserByEmail(widget.userEmail);
  }
@override
Widget build(BuildContext context) {
  return FutureBuilder<User?>(
    future: _userFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          // Imprimir e exibir qualquer erro que ocorra
          print("Error fetching user: ${snapshot.error}");
          return Center(child: Text('Erro ao buscar usuário: ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          User? user = snapshot.data;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('User Email: ${user?.email}'),
                Text('User Name: ${user?.name}'),
                // ... Adicione mais campos conforme necessário
              ],
            ),
          );
        } else {
          // Se não houver dados, exibir esta mensagem
          return Center(child: Text('Nenhum usuário encontrado com esse e-mail.'));
        }
      } else {
        // Indicador de carregamento enquanto o estado não está 'done'
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}
}
