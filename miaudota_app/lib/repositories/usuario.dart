import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:miaudota_app/repositories/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UsuarioRepository {
  final storage = FlutterSecureStorage();
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    try {
      final response = await http.post(
        Repository.API_USUARIOS_LOGIN,
        body: {
          'username': username,
          'password': password,
        },
      );
      final body = json.decode(response?.body);
      if (response.statusCode == 200) {
        print('[Login sucessfull]');
        // await storage.write(key: 'token', value: body['id']);
        // await storage.write(key: 'realm', value: body['realm']);
        // await storage.write(key: 'userId', value: body['userId']);
        return body['id'];
      } else {
        print('[Login failed]');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
    return;
  }

  Future<bool> hasToken() async {
    final String token = await storage.read(key: 'token');
    if (token != null) {
      return true;
    }
    return false;
  }
}
