// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  int qtdatual;
  int qtdsolicitado;
  int id;

  Item({
    this.qtdatual,
    this.qtdsolicitado,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        qtdatual: json["qtdatual"],
        qtdsolicitado: json["qtdsolicitado"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "qtdatual": qtdatual.toString(),
        "qtdsolicitado": qtdsolicitado.toString(),
      };
}
