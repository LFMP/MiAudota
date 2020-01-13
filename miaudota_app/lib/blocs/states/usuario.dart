import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:miaudota_app/models/contatos.dart';
import 'package:miaudota_app/models/endereco.dart';
import 'package:miaudota_app/models/usuario.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState(this.usuario, this.contatos, this.enderecos);
  final UsuarioModel usuario;
  final List<ContatosModel> contatos;
  final List<EnderecoModel> enderecos;
  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {
  const UserProfileInitial(UsuarioModel usuario) : super(usuario, null, null);
}

class UserProfileLoading extends UserProfileState {
  const UserProfileLoading(UsuarioModel usuario) : super(usuario, null,null);
}

class UserProfileLoaded extends UserProfileState {
  const UserProfileLoaded(UsuarioModel usuario, List<ContatosModel> contatos,
      List<EnderecoModel> enderecos)
      : super(usuario, contatos, enderecos);
}

class UserProfileModified extends UserProfileState {
  const UserProfileModified(UsuarioModel usuario) : super(usuario, null,null);
}

class UserProfileFailure extends UserProfileState {
  const UserProfileFailure({@required this.error}) : super(null, null,null);
  final String error;

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'UserProfileFailure { error: $error }';
}
