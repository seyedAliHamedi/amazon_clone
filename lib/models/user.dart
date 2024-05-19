import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String userType;
  final String token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.address,
      required this.userType,
      required this.token});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'userType': userType,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      password: map['password'] ?? "",
      address: map['address'] ?? "",
      userType: map['userType'] ?? "",
      token: map['token'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
