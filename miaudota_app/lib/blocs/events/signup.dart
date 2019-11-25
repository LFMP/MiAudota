import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SignUPEvent extends Equatable {
  const SignUPEvent();
}

class SignUPButtonPressed extends SignUPEvent {
  const SignUPButtonPressed(
    this.cpf,
    this.cnpj, {
    @required this.nome,
    @required this.realm,
    @required this.username,
    @required this.email,
    @required this.password,
  });

  final String nome;
  final String realm;
  final String username;
  final String email;
  final String password;
  final String cpf;
  final String cnpj;

  @override
  List<Object> get props => [username, password, nome, realm, username, email];

  @override
  String toString() =>
      'SignUPButtonPressed { username: $username, password: $password }';
}
