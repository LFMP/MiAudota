import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/events/login.dart';
import 'package:miaudota_app/blocs/login.dart';
import 'package:miaudota_app/blocs/states/login.dart';
import 'package:miaudota_app/pages/cadastro_page.dart';
import 'package:miaudota_app/repositories/usuario.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key, this.userRepository}) : super(key: key);
  final UsuarioRepository userRepository;
  @override
  _LoginFormState createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  _LoginFormState(this.userRepository);
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  final UsuarioRepository userRepository;

  @override
  Widget build(BuildContext context) {
    void _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _userController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Container(
          padding: AppStyle.padding,
          color: AppStyle.colorCyan,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 180,
                height: 180,
                child: Image.asset('assets/logoMiaudotaEscrito.png'),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _userController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail ou username',
                  labelStyle: TextStyle(
                    color: AppStyle.colorWhite,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: AppStyle.colorWhite,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: AppStyle.colorWhite,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: AppStyle.colorWhite,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppStyle.colorWhite,
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
                child: SizedBox(
                  child: FlatButton(
                    child: Container(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppStyle.colorCyanEightHundred,
                        ),
                      ),
                    ),
                    onPressed: () => _onLoginButtonPressed(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppStyle.colorWhite,
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
                child: SizedBox(
                  child: FlatButton(
                    child: Container(
                      child: Text(
                        'Cadastrar-se',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppStyle.colorCyanEightHundred,
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      SlideRoute(
                        page: CadastroPage(
                          userRepository: userRepository,
                        ),
                        direction: SlideDirection.RIGHT_LEFT,
                      ),
                      (_) => true,
                    ),
                  ),
                ),
              ),
              Container(
                child: state is LoginLoading
                    ? const CircularProgressIndicator()
                    : null,
              ),
            ],
          ),
        );
      }),
    );
  }
}