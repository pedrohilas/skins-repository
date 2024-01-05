import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;
  static final table = 'user_table';
  static final columnId = 'id';
  static final columnName = 'name';
  static const columnLastname ='lastname';
  static const columnPhoneNumber ='PhoneNumber';
  static const columnaddress ='address';
  static final columnEmail = 'email';
  static final columnPassword = 'password';


  // Singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;  // Fazendo _database nullable
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
  // Open the database and create the table
 _initDatabase() async {
  String path = join(await getDatabasesPath(), _databaseName);
  print("Caminho do banco de dados: $path");  // Isso irá imprimir o caminho do banco de dados
  return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
}
Future<User?> loginUser(String email, String password) async {
    final db = await database;

    // Busca o usuário pelo email e senha
    final result = await db.query(
      table,
      where: "$columnEmail = ? AND $columnPassword = ?",
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      // Retorna o usuário se encontrado
      return User.fromMap(result.first);
    }

    // Retorna null se o usuário não for encontrado 
    return null;
  }
 

  Future _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $table (
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnName TEXT NOT NULL,
    $columnLastname TEXT NOT NULL,
    $columnEmail TEXT NOT NULL,
    $columnPassword TEXT NOT NULL,
    $columnPhoneNumber TEXT NOT NULL,
    $columnaddress TEXT NOT NULL
  )
''');

  }
    // Função para buscar um usuário pelo e-mail
   // Função para buscar um usuário pelo e-mail
Future<User?> getUserByEmail(String userEmail) async {
  final db = await database;

  List<Map<String, dynamic>> queryResult = await db.query(
    'user_table',
    where: '$columnEmail = ?',  // Usando a variável correta
    whereArgs: [userEmail],
  );


  // Verifica se encontrou algum usuário e retorna o primeiro resultado
  if (queryResult.isNotEmpty) {
    return User.fromMap(queryResult.first); // Certifique-se de que fromMap aceita Map<String, dynamic>
  } else {
    return null; // Retorna nulo se nenhum usuário for encontrado
  }
}





  // Insert a User into the database
  Future<void> insertUser(User user) async {
    Database db = await database;
    await db.insert(
      table,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all users from the database
  Future<List<User>> users(User newUser) async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        lastname: maps[i]['lastname'],
        address: maps[i]['address'],
        email: maps[i]['email'],
        password: maps[i]['password'], 
        PhoneNumber: maps[i]['PhoneNumber'], 

        
              
 );
    });
  }

  // Update a User in the database
  Future<void> updateUser(User user) async {
    Database db = await database;
    await db.update(
      table,
      user.toMap(),
      where: "$columnId = ?",
      whereArgs: [user.id],
    );
  }

  // Delete a User from the database
  Future<void> deleteUser(int id) async {
    Database db = await database;
    await db.delete(
      table,
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }
}
