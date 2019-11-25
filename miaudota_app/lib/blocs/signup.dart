import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:miaudota_app/blocs/authentication.dart';
import 'package:miaudota_app/blocs/events/signup.dart';
import 'package:miaudota_app/blocs/states/signup.dart';
import 'package:miaudota_app/repositories/usuario.dart';

class SignUPBloc extends Bloc<SignUPEvent, SignUPState> {
  SignUPBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  final UsuarioRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  SignUPState get initialState => SignUPInitial();

  @override
  Stream<SignUPState> mapEventToState(SignUPEvent event) async* {
    if (event is SignUPButtonPressed) {
      yield SignUPLoading();

      try {
        final userID = await userRepository.signUp(
          username: event.username,
          password: event.password,
          nome: event.nome,
          realm: event.realm,
          email: event.email,
        );
        if (event.realm == 'Entidade') {
          await userRepository.dispatchEntidade(
            cnpj: event.cpf,
            usuarioId: userID,
          );
        } else {
          await userRepository.dispatchNormal(
            cpf: event.cpf,
            usuarioId: userID,
          );
        }
        yield SignUPInitial();
      } catch (error) {
        yield SignUPFailure(error: error.toString());
      }
    }
  }
}
