import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class UpdateUserEvent extends Equatable {
  const UpdateUserEvent();
}

class UpdateUserbuttonPressed extends UpdateUserEvent {
  const UpdateUserbuttonPressed({
    @required this.nome,
    @required this.foto,
    @required this.realm,
    @required this.username,
    @required this.email,
    @required this.password,
  });

  final String nome;
  final String foto;
  final String realm;
  final String email;
  final String username;
  final String password;

  @override
  List<Object> get props => [nome, foto, realm, username, email, password];

  @override
  String toString() => 'UpdateUsuarioPressed{ username: $username }';
}

class LoadUserInformations extends UpdateUserEvent {
  const LoadUserInformations() : super();
  @override
  List<Object> get props => [];
}
