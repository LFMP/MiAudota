import 'dart:convert';

class ContatosModel {
  ContatosModel({
    this.ddd,
    this.telefone,
    this.id,
    this.usuarioId,
  });

  factory ContatosModel.fromMap(Map<String, dynamic> json) => ContatosModel(
        ddd: json['ddd'] ?? json['ddd'],
        telefone: json['telefone'] ?? json['telefone'],
        id: json['id'] ?? json['id'],
        usuarioId: json['usuarioId'] ?? json['usuarioId'],
      );

  factory ContatosModel.fromJson(String str) =>
      ContatosModel.fromMap(json.decode(str));

  final String ddd;
  final String telefone;
  final String id;
  final String usuarioId;

  ContatosModel copyWith({
    String ddd,
    String telefone,
    String id,
    String usuarioId,
  }) =>
      ContatosModel(
        ddd: ddd ?? this.ddd,
        telefone: telefone ?? this.telefone,
        id: id ?? this.id,
        usuarioId: usuarioId ?? this.usuarioId,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'ddd': ddd ?? ddd,
        'telefone': telefone ?? telefone,
        'usuarioId': usuarioId ?? usuarioId,
      };

  static List<ContatosModel> fromJsonList(List _jsonList) => _jsonList == null
      ? []
      : _jsonList
          .map((contatoJson) => ContatosModel.fromJson(contatoJson))
          .toList();
}
