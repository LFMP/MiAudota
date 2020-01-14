// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';

class UsuarioModel {
  UsuarioModel({
    this.nome,
    this.foto,
    this.realm,
    this.username,
    this.password,
    this.email,
    this.emailVerified,
    this.id,
  });

  factory UsuarioModel.fromJson(String str) =>
      UsuarioModel.fromMap(json.decode(str));

  factory UsuarioModel.fromMap(Map<String, dynamic> json) => UsuarioModel(
        nome: json['nome'] ?? json['nome'],
        foto: json['foto'] ?? json['foto'],
        realm: json['realm'] ?? json['realm'],
        username: json['username'] ?? json['username'],
        password: json['password'] ?? json['password'],
        email: json['email'] ?? json['email'],
        emailVerified: json['emailVerified'] ?? ['emailVerified'],
        id: json['id'] ?? json['id'],
      );

  final String nome;
  final String foto;
  final String realm;
  final String username;
  final String password;
  final String email;
  final bool emailVerified;
  final String id;

  UsuarioModel copyWith({
    String nome,
    String foto,
    String realm,
    String username,
    String password,
    String email,
    bool emailVerified,
    String id,
  }) =>
      UsuarioModel(
        nome: nome ?? this.nome,
        foto: foto ?? this.foto,
        realm: realm ?? this.realm,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        emailVerified: emailVerified ?? this.emailVerified,
        id: id ?? this.id,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'nome': nome ?? nome,
        'foto': foto ?? foto,
        'realm': realm ?? realm,
        'username': username ?? username,
        'password': password ?? password,
        'email': email ?? email,
        'emailVerified': emailVerified ?? emailVerified,
        'id': id ?? id,
      };
}
