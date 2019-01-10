import 'dart:convert';

Animal animalFromJson(String str) => Animal.fromJson(json.decode(str));

String animalToJson(Animal data) => json.encode(data.toJson());

class Animal {
  String sexo;
  String raca;
  String porte;
  int idade;
  int id;

  Animal({
    this.sexo,
    this.raca,
    this.porte,
    this.idade,
    this.id,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        sexo: json["sexo"],
        raca: json["raca"],
        porte: json["porte"],
        idade: json["idade"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "sexo": sexo,
        "raca": raca,
        "porte": porte,
        "idade": idade.toString(),
      };
}
