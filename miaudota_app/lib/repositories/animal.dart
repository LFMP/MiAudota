import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:miaudota_app/models/animal.dart';
import 'package:miaudota_app/repositories/repository.dart';

class AnimalRepository {
  static const storage = FlutterSecureStorage();
  static Future<Animal> createAnimal(Animal animal) async {
    try {
      final js = animal.toJson();
      final String token = await storage.read(key: "token");
      final http.Response response = await http.post(Repository.API_ANIMAL,
          body: js, headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 200) {
        final Animal meuAnimal = Animal.fromJson(json.decode(response.body));
        return meuAnimal;
      }
    } catch (error) {}
    return null;
  }

  static Future<bool> deleteAnimal(Animal animal) async {
    try {
      final String token = await storage.read(key: "token");
      final http.Response response = await http.delete(
          Repository.API_ITEM + '/${animal.id}',
          headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {}
    return false;
  }
}
