import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/models/contatos.dart';
import 'package:miaudota_app/models/endereco.dart';
import 'package:miaudota_app/models/usuario.dart';
import 'package:miaudota_app/repositories/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AnuncioRepository extends Repository {
  static const storage = FlutterSecureStorage();
  Future<List<Anuncio>> getAnuncios() async {
    try {
      final http.Response response = await http.get(
        Repository.API_ANUNCIOS,
      );
      var teste = jsonDecode(response.body);
      var teste2 = Anuncio.fromJsonList(teste);
      return teste2;
    } catch (e) {
      return null;
    }
  }

  // Future<bool> setAnuncio({String titulo}) async {
  //   try {
  //     final http.Response response =
  //         await http.post(Repository.API_ANUNCIOS, body: {
  //       'titulo': titulo,
  //       'descricao': descricao,
  //       'raca': raca,
  //     });
  //     return response.statusCode == 200;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
