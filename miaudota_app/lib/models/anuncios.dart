// To parse this JSON data, do
//
//     final anuncio = anuncioFromJson(jsonString);

import 'dart:convert';

List<Anuncio> anuncioFromJson(String str) =>
    List<Anuncio>.from(json.decode(str).map((x) => Anuncio.fromJson(x)));

String anuncioToJson(List<Anuncio> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Anuncio {
  String titulo;
  String descricao;
  String foto;
  DateTime data;
  int id;
  int animalId;
  int itemId;

  Anuncio({
    this.titulo,
    this.descricao,
    this.foto,
    this.data,
    this.id,
    this.animalId,
    this.itemId,
  });

  factory Anuncio.fromJson(Map<String, dynamic> json) => Anuncio(
        titulo: json["titulo"],
        descricao: json["descricao"],
        foto: json["foto"],
        data: DateTime.parse(json["data"]),
        id: json["id"],
        animalId: json["animalId"],
        itemId: json["itemId"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "descricao": descricao,
        "foto": foto,
        "data": data.toIso8601String(),
        "id": id,
        "animalId": animalId,
        "itemId": itemId,
      };

  static List<Anuncio> fromJsonList(List list) => list == null || list.isEmpty
      ? []
      : list.map((item) => Anuncio.fromJson(item)).toList();

  @override
  String toString() {
    return '$titulo, $descricao';
  }
}
