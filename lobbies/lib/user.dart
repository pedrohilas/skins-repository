class User {
   final int? id;
  final String name;
  final String password;
  String _email;  // Campo privado para email
  final String lastname;
  // ignore: non_constant_identifier_names
  final String PhoneNumber;
  final String address;
  // Construtor atualizado
  // ignore: non_constant_identifier_names
  User({this.id, required this.name,required this.lastname, required this.PhoneNumber,required this.address ,required this.password, required String email,}) 
    : _email = email;

  // Getter público para email
  String get email => _email;
  // Setter para name
  set email(String newEmail) {
    _email = newEmail;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname':lastname,
      'PhoneNumber':PhoneNumber,
      'address':address,
      'password': password,
      'email': email,
  
    };
  }

  // Note que o construtor `fromMap` assume que os campos não serão nulos no Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
     id: map['id'], // O ID pode ser nulo
    name: map['name'] ?? 'Nome Padrão', 
    lastname: map['lastname'] ?? 'Nome',// Valor padrão se for nulo
    address: map['address']?? 'Nome',
    PhoneNumber:map['PhoneNumber']?? 'Nome',
    password: map['password'] ?? '', // Valor padrão se for nulo
     email: map['email'], 
      // Valor padrão se for nulo
  
  );
  }
} 
 