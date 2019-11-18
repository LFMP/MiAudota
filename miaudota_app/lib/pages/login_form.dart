import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/events/login.dart';
import 'package:miaudota_app/blocs/login.dart';
import 'package:miaudota_app/blocs/states/login.dart';
import 'package:miaudota_app/pages/cadastro_page.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
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
                style: TextStyle(
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
                style: TextStyle(
                  fontSize: 20,
                  color: AppStyle.colorWhite,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppStyle.colorWhite,
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
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
                    onPressed: () =>
                        state is! LoginLoading ? _onLoginButtonPressed : null,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppStyle.colorWhite,
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
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
                        page: CadastroPage(),
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
