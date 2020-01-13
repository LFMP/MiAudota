import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:miaudota_app/models/animal.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/models/contatos.dart';
import 'package:miaudota_app/models/endereco.dart';
import 'package:miaudota_app/models/modelo_Item.dart';
import 'package:miaudota_app/models/usuario.dart';
import 'package:miaudota_app/repositories/animal.dart';
import 'package:miaudota_app/repositories/item.dart';
import 'package:miaudota_app/repositories/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AnuncioRepository extends Repository {
  static const storage = FlutterSecureStorage();
  Future<List<Anuncio>> getAnuncios() async {
    try {
      final http.Response response = await http.get(
        Repository.API_ANUNCIOS_FILTER,
      );
      var teste = jsonDecode(response.body);
      var teste2 = Anuncio.fromJsonList(teste);
      return teste2;
    } catch (e) {
      return null;
    }
  }

  static Future<Anuncio> createAnuncio(Anuncio anuncio) async {
    try {
      final Item item = anuncio.item == null
          ? null
          : await ItemRepository.createItem(anuncio.item);
      if (item != null) {
        anuncio.item = item;
      }
      final Animal animal = anuncio.animal == null
          ? null
          : await AnimalRepository.createAnimal(anuncio.animal);
      if (item != null) {
        anuncio.item = item;
      }
      if (animal != null) {
        anuncio.animal = animal;
      }
      final anuncioJson = anuncio.toJson();
      final String token = await storage.read(key: "token");
      final http.Response response = await http.post(Repository.API_ANUNCIOS,
          body: anuncioJson, headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 200) {
        final Anuncio meuAnuncio = Anuncio.fromJson(json.decode(response.body));
        return meuAnuncio;
      }
    } catch (e) {
      print('errror: $e');
    }
    return null;
  }

  static Future<bool> deleteAnuncio(Anuncio anuncio) async {
    try {
      final bool itemDeleted = anuncio.item == null
          ? true
          : await ItemRepository.deleteItem(anuncio.item);
      final bool animalDeleted = anuncio.animal == null
          ? true
          : await AnimalRepository.deleteAnimal(anuncio.animal);

      final String token = await storage.read(key: "token");
      final http.Response response = await http.delete(
          Repository.API_ANUNCIOS + '/${anuncio.id}',
          headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print('errror: $e');
    }
    return false;
  }
}
