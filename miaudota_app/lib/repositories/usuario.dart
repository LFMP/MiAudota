import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:miaudota_app/repositories/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UsuarioRepository {
  static const storage = FlutterSecureStorage();
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
        print(body.toString());
        await storage.write(key: 'token', value: body['id']);
        await storage.write(key: 'userId', value: body['userId']);
        await storage.write(key: 'nome', value: body['user']['nome']);
        await storage.write(key: 'realm', value: body['user']['realm']);
        await storage.write(key: 'username', value: body['user']['username']);
        await storage.write(key: 'email', value: body['user']['email']);
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

  Future<String> signUp({
    @required String nome,
    @required String realm,
    @required String username,
    @required String email,
    @required String password,
  }) async {
    try {
      final response = await http.post(
        Repository.API_USUARIOS,
        body: {
          'nome': nome,
          'realm': realm,
          'username': username,
          'email': email,
          'password': password
        },
      );
      final body = json.decode(response?.body);
      if (response.statusCode == 200) {
        print('[Sign UP sucessfull]');
        await storage.write(key: 'userId', value: body['id'].toString());
        await storage.write(key: 'nome', value: body['nome']);
        await storage.write(key: 'realm', value: body['realm']);
        await storage.write(key: 'username', value: body['username']);
        await storage.write(key: 'email', value: body['email']);
        return body['id'].toString();
      } else {
        print('[Sign UP failed]');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> dispatchNormal({
    @required String usuarioId,
    @required String cpf,
  }) async {
    try {
      final response = await http.post(
        Repository.API_NORMAIS,
        body: {
          'cpf': cpf,
          'usuarioId': usuarioId,
        },
      );
      final body = json.decode(response?.body);
      if (response.statusCode == 200) {
        print('[Normal sucessfull]');
        await storage.write(key: 'nomalId', value: body['id'].toString());
        await storage.write(key: 'cpf', value: body['cpf']);
      } else {
        print('[Normal failed]');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> dispatchEntidade({
    @required String usuarioId,
    @required String cnpj,
  }) async {
    try {
      final response = await http.post(
        Repository.API_ENTIDADES,
        body: {
          'cnpj': cnpj,
          'usuarioId': usuarioId,
        },
      );
      final body = json.decode(response?.body);
      if (response.statusCode == 200) {
        print('[Entidade sucessfull]');
        await storage.write(key: 'nomalId', value: body['id'].toString());
        await storage.write(key: 'cnpj', value: body['cnpj']);
      } else {
        print('[Entidade failed]');
      }
    } catch (e) {
      print(e);
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
