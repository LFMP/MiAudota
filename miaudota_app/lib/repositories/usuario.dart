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
        print(body);
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

  Future<bool> deleteUsuario() async {
    final token = await storage.read(key: 'token');
    final id = await storage.read(key: 'userId');
    try {
      final response = await http.delete(Repository.API_USUARIOS + id,
          headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 204) {
        print('[Delete usuario sucess]');
        return true;
      } else {
        print('[Delete usuario fail]');
        print(response.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
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
        print(body.toString());
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> postContato({
    @required String ddd,
    @required String telefone,
  }) async {
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    try {
      final response = await http
          .post(Repository.API_CONTATOS.replaceFirst('\$', userId), headers: {
        HttpHeaders.authorizationHeader: token
      }, body: {
        'ddd': ddd,
        'telefone': telefone,
      });
      if (response.statusCode == 200) {
        print('[Post contato sucess]');
        return true;
      } else {
        print('[Post contato fail]');
        print(response.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> editContato({
    @required String ddd,
    @required String telefone,
    @required String id,
  }) async {
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    try {
      final response = await http.put(
          Repository.API_CONTATOS.replaceFirst('\$', userId) + '/' + id,
          headers: {
            HttpHeaders.authorizationHeader: token,
          },
          body: {
            'ddd': ddd,
            'telefone': telefone,
            'id': id,
            'usuarioId': userId,
          });
      if (response.statusCode == 200) {
        print('[Edit contato sucess]');
        return true;
      } else {
        print('[Edit contato fail]');
        print(response.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteContato({
    @required String id,
  }) async {
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    try {
      final response = await http.delete(
          Repository.API_CONTATOS.replaceFirst('\$', userId) + '/' + id,
          headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 204) {
        print('[Delete contato sucess]');
        return true;
      } else {
        print('[Delete contato fail]');
        print(response.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
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

  Future<bool> postEndereco({
    @required String cep,
    @required String rua,
    @required String cidade,
    @required String estado,
    @required String numero,
    @required String complemento,
  }) async {
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    try {
      final response = await http
          .post(Repository.API_ENDERECOS.replaceFirst('\$', userId), headers: {
        HttpHeaders.authorizationHeader: token
      }, body: {
        'cep': cep,
        'rua': rua,
        'cidade': cidade,
        'estado': estado,
        'numero': numero,
        'complemento': complemento,
      });
      if (response.statusCode == 200) {
        print('[Post contato sucess]');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> editEndereco({
    @required String cep,
    @required String rua,
    @required String cidade,
    @required String estado,
    @required String numero,
    @required String complemento,
    @required String id,
  }) async {
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    try {
      final response = await http.put(
          Repository.API_ENDERECOS.replaceFirst('\$', userId) + '/' + id,
          headers: {
            HttpHeaders.authorizationHeader: token,
          },
          body: {
            'cep': cep,
            'rua': rua,
            'cidade': cidade,
            'estado': estado,
            'numero': numero,
            'complemento': complemento,
            'id': id,
            'usuarioId': userId,
          });
      if (response.statusCode == 200) {
        print('[Edit endereco sucess]');
        return true;
      } else {
        print('[Edit endereco fail]');
        print(response.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteEndereco({
    @required String id,
  }) async {
    final token = await storage.read(key: 'token');
    final userId = await storage.read(key: 'userId');
    try {
      final response = await http.delete(
          Repository.API_ENDERECOS.replaceFirst('\$', userId) + '/' + id,
          headers: {HttpHeaders.authorizationHeader: token});
      if (response.statusCode == 204) {
        print('[Delete endereco sucess]');
        return true;
      } else {
        print('[Delete endereco fail]');
        print(response.body);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
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
    await storage.delete(key: 'imagem');
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
