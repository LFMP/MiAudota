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

class InsertContatoButtonPressed extends UpdateUserEvent {
  const InsertContatoButtonPressed({
    @required this.ddd,
    @required this.telefone,
  }) : super();
  final String ddd;
  final String telefone;
  @override
  List<Object> get props => [ddd, telefone];
}

class InsertEnderecoButtonPressed extends UpdateUserEvent {
  const InsertEnderecoButtonPressed({
    @required this.cep,
    @required this.rua,
    @required this.cidade,
    @required this.estado,
    @required this.numero,
    @required this.complemento,
  }) : super();

  final String cep;
  final String rua;
  final String cidade;
  final String estado;
  final String numero;
  final String complemento;

  @override
  List<Object> get props => [cep, rua, cidade, estado, numero, complemento];
}

class DeleteContatoButtonPressed extends UpdateUserEvent {
  const DeleteContatoButtonPressed({@required this.id});
  final String id;
  @override
  List<Object> get props => [id];
}

class DeleteEnderecoButtonPressed extends UpdateUserEvent {
  const DeleteEnderecoButtonPressed({@required this.id});
  final String id;
  @override
  List<Object> get props => [id];
}

class EditContatoButtonPressed extends UpdateUserEvent {
  const EditContatoButtonPressed({
    @required this.id,
    @required this.ddd,
    @required this.telefone,
  });
  final String id;
  final String ddd;
  final String telefone;
  @override
  List<Object> get props => [id, ddd, telefone];
}

class EditEnderecoButtonPressed extends UpdateUserEvent {
  const EditEnderecoButtonPressed({
    @required this.id,
    @required this.cep,
    @required this.rua,
    @required this.cidade,
    @required this.estado,
    @required this.numero,
    @required this.complemento,
  });
  final String id;
  final String cep;
  final String rua;
  final String cidade;
  final String estado;
  final String numero;
  final String complemento;
  @override
  List<Object> get props => [
        id,
        cep,
        rua,
        cidade,
        estado,
        numero,
        complemento,
      ];
}
