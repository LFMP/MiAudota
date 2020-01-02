import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:miaudota_app/blocs/authentication.dart';
import 'package:miaudota_app/blocs/events/authentication.dart';
import 'package:miaudota_app/blocs/events/login.dart';
import 'package:miaudota_app/blocs/states/login.dart';
import 'package:miaudota_app/repositories/usuario.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  final UsuarioRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        print('token: ' + token);
        if (token != null) {
          authenticationBloc.add(LoggedIn(token: token));
          yield LoginInitial();
        } else {
          yield const LoginFailure(error: 'Login invalido');
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
