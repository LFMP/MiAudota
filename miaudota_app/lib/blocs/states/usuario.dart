import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:miaudota_app/models/usuario.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState(this.usuario);
  final UsuarioModel usuario;
  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {
  const UserProfileInitial(UsuarioModel usuario) : super(usuario);
}

class UserProfileLoading extends UserProfileState {
  const UserProfileLoading(UsuarioModel usuario) : super(usuario);
}

class UserProfileLoaded extends UserProfileState {
  const UserProfileLoaded(UsuarioModel usuario) : super(usuario);
}

class UserProfileModified extends UserProfileState {
  const UserProfileModified(UsuarioModel usuario) : super(usuario);
}

class UserProfileFailure extends UserProfileState {
  const UserProfileFailure({@required this.error}) : super(null);
  final String error;

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'UserProfileFailure { error: $error }';
}
