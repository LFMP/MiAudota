import 'dart:convert';
import 'package:flutter/cupertino.dart'; // For debug only
// Foreign
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// Repositories
import 'package:miaudota_app/repositories/repository.dart';
// Models
import 'package:miaudota_app/models/authentication.dart';
import 'package:miaudota_app/models/api_response.dart';

class AuthRepository extends Repository {
  static const storage = FlutterSecureStorage();
  Future<APIResponse> login(AuthRequest request) async {
    try {
      final response = await http.post(
        Repository.API_USUARIOS_LOGIN,
        body: request.toJson(),
      );

      final body = json.decode(response?.body) ?? json.decode(response?.body);
      print(body);

      final result = AuthResponse.fromJson(body);
      result.setStatusCode = response.statusCode;

      if (response.statusCode == 200) {
        print('[Login sucessfull]');

        await storage.write(key: 'token', value: result.token);
        await storage.write(key: 'realm', value: result.realm);
        await storage.write(key: 'userId', value: result.userId);
        return result;
      } else {
        print('[Login failed]');
        return APIError.fromJson(body);
      }
    } catch (e) {
      print(e);
      debugPrintStack();
      return APIError(message: e.toString());
    }
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }

  Future<bool> hasToken() async {
    final String token = await storage.read(key: 'token');
    if (token != null) {
      return true;
    }
    return false;
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }
}
