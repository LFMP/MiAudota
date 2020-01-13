import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:miaudota_app/models/modelo_Item.dart';
import 'package:miaudota_app/repositories/repository.dart';

class ItemRepository {
  static const storage = FlutterSecureStorage();
  static Future<Item> createItem(Item item) async {
    try {
      final js = item.toJson();
      final String token = await storage.read(key: "token");
      final http.Response response = await http.post(Repository.API_ITEM,
          body: js, headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 200) {
        final Item meuItem = Item.fromJson(json.decode(response.body));
        return meuItem;
      }
    } catch (error) {}
    return null;
  }

  static Future<bool> deleteItem(Item item) async {
    try {
      final String token = await storage.read(key: "token");
      final http.Response response = await http.delete(
          Repository.API_ITEM + '/${item.id}',
          headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {}
    return false;
  }
}
