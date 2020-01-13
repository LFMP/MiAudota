import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:miaudota_app/models/contatos.dart';
import 'package:miaudota_app/models/endereco.dart';
import 'package:miaudota_app/models/usuario.dart';
import 'package:miaudota_app/repositories/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UsuarioRepository extends Repository {
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
        await storage.write(key: 'userId', value: body['userId'].toString());
        await storage.write(key: 'nome', value: body['user']['nome']);
        await storage.write(key: 'realm', value: body['user']['realm']);
        await storage.write(key: 'username', value: body['user']['username']);
        await storage.write(key: 'email', value: body['user']['email']);
        await storage.write(key: 'password', value: password);
        if (body['user']['foto'] != null) {
          await storage.write(key: 'imagem', value: body['user']['foto']);
        }
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

  Future<bool> dispatchNormal({
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
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> dispatchEntidade({
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
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<UsuarioModel> getLocalUsuario() async {
    return UsuarioModel(
      nome: await storage.read(key: 'nome'),
      foto: await storage.read(key: 'imagem'),
      realm: await storage.read(key: 'realm'),
      username: await storage.read(key: 'username'),
      email: await storage.read(key: 'email'),
      password: await storage.read(key: 'password'),
      id: await storage.read(key: 'userId'),
      emailVerified: true,
    );
  }

  Future<List<ContatosModel>> getContatos({
    @required String usuarioId,
  }) async {
    final token = await storage.read(key: 'token');
    try {
      final response = await http.get(
        Repository.API_CONTATOS.replaceFirst('\$', usuarioId),
        headers: {HttpHeaders.authorizationHeader: token},
      );
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        print('[GET contatos sucess]');
        return ContatosModel.fromJsonList(body);
      } else {
        print('[GET contatos failed]');
        print(body);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<EnderecoModel>> getEnderecos({
    @required String usuarioId,
  }) async {
    final token = await storage.read(key: 'token');
    try {
      final response = await http.get(
        Repository.API_ENDERECOS.replaceFirst('\$', usuarioId),
        headers: {HttpHeaders.authorizationHeader: token},
      );
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        print('[GET enderecos sucess]');
        return EnderecoModel.fromJsonList(body);
      } else {
        print('[GET enderecos failed]');
        print(body);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> updateUsuario({
    @required String nome,
    @required String foto,
    @required String realm,
    @required String username,
    @required String email,
    @required String password,
  }) async {
    final userId = await storage.read(key: 'userId');
    final token = await storage.read(key: 'token');
    try {
      await http.post(
        Repository.API_REPLACE_USER.replaceFirst('\$', userId),
        headers: {HttpHeaders.authorizationHeader: token},
        body: {
          'nome': nome,
          'foto': foto,
          'realm': realm,
          'username': username,
          'email': email,
          'password': password,
        },
      );
    } catch (e) {
      print('[ERRO]: ');
      print(e);
      return false;
    }
    return true;
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
