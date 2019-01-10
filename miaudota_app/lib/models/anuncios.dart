import 'dart:convert';

import 'package:miaudota_app/models/animal.dart';
import 'package:miaudota_app/models/modelo_Item.dart';

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
  Animal animal;
  Item item;

  Anuncio({
    this.titulo,
    this.descricao,
    this.foto,
    this.data,
    this.id,
    this.animal,
    this.item,
  });

  factory Anuncio.fromJson(Map<String, dynamic> json) => Anuncio(
      titulo: json["titulo"],
      descricao: json["descricao"],
      foto: json["foto"],
      data: DateTime.parse(json["data"]),
      id: json["id"],
      animal: json["animal"] == null ? null : Animal.fromJson(json["animal"]),
      item: json["item"] == null ? null : Item.fromJson(json["item"]));

  Map<String, dynamic> toJson() {
    final json = {
      "titulo": titulo,
      "descricao": descricao,
      "foto": foto,
      "data": data.toIso8601String(),
    };
    if (item != null) json["itemId"] = item.id.toString();
    if (animal != null) json["animalId"] = animal.id.toString();
    return json;
  }

  static List<Anuncio> fromJsonList(List list) => list == null || list.isEmpty
      ? []
      : list.map((item) => Anuncio.fromJson(item)).toList();

  @override
  String toString() {
    return '$titulo, $descricao';
  }
}
