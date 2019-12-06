import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/signup.dart';
import 'package:miaudota_app/pages/cadastro_form.dart';
import 'package:miaudota_app/repositories/usuario.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  final UsuarioRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) {
          return SignUPBloc(
            userRepository: userRepository,
          );
        },
        child: CadastroForm(),
      ),
    );
  }
}
