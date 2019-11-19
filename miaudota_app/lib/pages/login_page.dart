import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/authentication.dart';
import 'package:miaudota_app/blocs/login.dart';
import 'package:miaudota_app/pages/login_form.dart';
import 'package:miaudota_app/repositories/usuario.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  final UsuarioRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
