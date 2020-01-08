import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/events/signup.dart';
import 'package:miaudota_app/blocs/signup.dart';
import 'package:miaudota_app/blocs/states/signup.dart';
import 'package:miaudota_app/utils/style.dart';

class PessoaFisica extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _onSignUPButtonPressed() async {
      BlocProvider.of<SignUPBloc>(context).add(
        SignUPButtonPressed(
          username: _usernameController.text,
          nome: _nameController.text,
          password: _passwordController.text,
          email: _emailController.text,
          cpf: _cpfController.text,
          realm: 'Normal',
        ),
      );
    }

    return Container(
      padding: AppStyle.padding,
      color: AppStyle.colorWhite,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(
                color: AppStyle.colorCyanNineHundred,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
              color: AppStyle.colorCyanEightHundred,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Nome',
              labelStyle: TextStyle(
                color: AppStyle.colorCyanNineHundred,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
              color: AppStyle.colorCyanEightHundred,
            ),
          ),
          TextFormField(
            controller: _cpfController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'CPF',
              labelStyle: TextStyle(
                color: AppStyle.colorCyanNineHundred,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
              color: AppStyle.colorCyanEightHundred,
            ),
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'E-mail',
              labelStyle: TextStyle(
                color: AppStyle.colorCyanNineHundred,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
              color: AppStyle.colorCyanEightHundred,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Senha',
              labelStyle: TextStyle(
                color: AppStyle.colorCyanNineHundred,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
              color: AppStyle.colorCyanEightHundred,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppStyle.colorCyan,
              borderRadius: const BorderRadius.all(Radius.circular(60)),
            ),
            child: SizedBox(
              child: FlatButton(
                child: Container(
                  child: Text(
                    'Concluir',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppStyle.colorWhite,
                    ),
                  ),
                ),
                onPressed: () => _onSignUPButtonPressed()
                    .whenComplete(() => Navigator.of(context).pop()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PessoaJuridica extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cnpjController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void _onSignUPButtonPressed() {
      BlocProvider.of<SignUPBloc>(context).add(
        SignUPButtonPressed(
          username: _usernameController.text,
          nome: _nameController.text,
          password: _passwordController.text,
          email: _emailController.text,
          realm: 'Entidade',
          cnpj: _cnpjController.text,
        ),
      );
    }

    return BlocListener<SignUPBloc, SignUPState>(
      listener: (context, state) {
        if (state is SignUPFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('$state'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<SignUPBloc, SignUPState>(
        builder: (context, state) {
          return Container(
            padding: AppStyle.padding,
            color: AppStyle.colorWhite,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: AppStyle.colorCyanNineHundred,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: AppStyle.colorCyanEightHundred,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Razão social',
                    labelStyle: TextStyle(
                      color: AppStyle.colorCyanNineHundred,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: AppStyle.colorCyanEightHundred,
                  ),
                ),
                TextFormField(
                  controller: _cnpjController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'CNPJ',
                    labelStyle: TextStyle(
                      color: AppStyle.colorCyanNineHundred,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: AppStyle.colorCyanEightHundred,
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: AppStyle.colorCyanNineHundred,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: AppStyle.colorCyanEightHundred,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: AppStyle.colorCyanNineHundred,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: AppStyle.colorCyanEightHundred,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppStyle.colorCyan,
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                  ),
                  child: SizedBox(
                    child: FlatButton(
                      child: Container(
                        child: Text(
                          'Próximo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppStyle.colorWhite,
                          ),
                        ),
                      ),
                      onPressed: () => _onSignUPButtonPressed(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CadastroForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
    home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Informações básicas',
            style: TextStyle(
              color: AppStyle.colorWhite,
            ),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Pessoa Física',
                icon: Icon(
                  Icons.person,
                  color: AppStyle.colorWhite,
                ),
              ),
              Tab(
                text: 'Pessoa Jurídica',
                icon: Icon(
                  Icons.people,
                  color: AppStyle.colorWhite,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PessoaFisica(),
            PessoaJuridica(),
          ],
        ),
      ),
    ),
    );
  }
}
