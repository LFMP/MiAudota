// To parse this JSON data, do
//
//     final enderecoModel = enderecoModelFromJson(jsonString);

import 'dart:convert';

class EnderecoModel {
  EnderecoModel({
    this.cep,
    this.rua,
    this.cidade,
    this.estado,
    this.numero,
    this.complemento,
    this.id,
    this.usuarioId,
  });

  factory EnderecoModel.fromJson(String str) =>
      EnderecoModel.fromMap(json.decode(str));

  factory EnderecoModel.fromMap(Map<String, dynamic> json) => EnderecoModel(
        cep: json['cep'] ?? json['cep'],
        rua: json['rua'] ?? json['rua'],
        cidade: json['cidade'] ?? json['cidade'],
        estado: json['estado'] ?? json['estado'],
        numero: json['numero'] ?? json['numero'],
        complemento: json['complemento'] ?? json['complemento'],
        id: json['id'] ?? json['id'],
        usuarioId: json['usuarioId'] ?? json['usuarioId'],
      );

  EnderecoModel copyWith({
    String cep,
    String rua,
    String cidade,
    String estado,
    String numero,
    String complemento,
    String id,
    String usuarioId,
  }) =>
      EnderecoModel(
        cep: cep ?? this.cep,
        rua: rua ?? this.rua,
        cidade: cidade ?? this.cidade,
        estado: estado ?? this.estado,
        numero: numero ?? this.numero,
        complemento: complemento ?? this.complemento,
        id: id ?? this.id,
        usuarioId: usuarioId ?? this.usuarioId,
      );

  final String cep;
  final String rua;
  final String cidade;
  final String estado;
  final String numero;
  final String complemento;
  final String id;
  final String usuarioId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'cep': cep ?? cep,
        'rua': rua ?? rua,
        'cidade': cidade ?? cidade,
        'estado': estado ?? estado,
        'numero': numero ?? numero,
        'complemento': complemento ?? complemento,
        'id': id ?? id,
        'usuarioId': usuarioId ?? usuarioId,
      };

  static List<EnderecoModel> fromJsonList(List _jsonList) => _jsonList == null
      ? []
      : _jsonList
          .map((contatoJson) => EnderecoModel.fromJson(contatoJson))
          .toList();
}
