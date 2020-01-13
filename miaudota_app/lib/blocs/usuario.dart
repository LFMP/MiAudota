import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:miaudota_app/blocs/events/usuario.dart';
import 'package:miaudota_app/blocs/states/usuario.dart';
import 'package:miaudota_app/models/contatos.dart';
import 'package:miaudota_app/models/endereco.dart';
import 'package:miaudota_app/models/usuario.dart';
import 'package:miaudota_app/repositories/usuario.dart';

class UserProfile extends Bloc<UpdateUserEvent, UserProfileState> {
  UserProfile(this.userRepository);
  final UsuarioRepository userRepository;

  @override
  UserProfileState get initialState => const UserProfileInitial(null);

  @override
  Stream<UserProfileState> mapEventToState(UpdateUserEvent event) async* {
    if (event is UpdateUserbuttonPressed) {
      yield const UserProfileLoading(null);
      try {
        await userRepository.updateUsuario(
          email: event.email,
          foto: event.foto,
          nome: event.nome,
          password: event.password,
          realm: event.realm,
          username: event.username,
        );
        yield const UserProfileModified(null);
      } catch (e) {
        yield UserProfileFailure(error: e.toString());
      }
    }
    if (event is LoadUserInformations) {
      yield const UserProfileLoading(null);
      final UsuarioModel usuario = await userRepository.getLocalUsuario();
      final List<ContatosModel> contatos =
          await userRepository.getContatos(usuarioId: usuario.id);
      final List<EnderecoModel> enderecos =
          await userRepository.getEnderecos(usuarioId: usuario.id);
      yield UserProfileLoaded(usuario, contatos, enderecos);
    }

    if (event is InsertContatoButtonPressed) {
      yield const UserProfileLoading(null);
      try {
        await userRepository.postContato(
          ddd: event.ddd,
          telefone: event.telefone,
        );
        yield const UserProfileInitial(null);
      } catch (e) {
        yield UserProfileFailure(error: e.toString());
      }
    }
    if (event is InsertEnderecoButtonPressed) {
      yield const UserProfileLoading(null);
      try {
        await userRepository.postEndereco(
          cep: event.cep,
          cidade: event.cidade,
          complemento: event.complemento,
          estado: event.estado,
          numero: event.numero,
          rua: event.rua,
        );
        yield const UserProfileInitial(null);
      } catch (e) {
        yield UserProfileFailure(error: e.toString());
      }
    }
  }
}
