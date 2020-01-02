import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/events/signup.dart';
import 'package:miaudota_app/blocs/signup.dart';
import 'package:miaudota_app/blocs/states/signup.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class PessoaFisica extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpfController = MaskedTextController(mask: '000.000.000-00');
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    const Pattern emailpattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp emailregex = RegExp(emailpattern);

    void _onSignUPButtonPressed() {
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
      child: Form(
        key: _formKey,
        autovalidate: true,
        onChanged: () => _formKey.currentState.validate(),
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
              validator: (value) {
                if (value.isEmpty) {
                  return 'O campo não pode ser vazio';
                }
                return null;
              },
              style: const TextStyle(
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
              validator: (value) {
                if (value.isEmpty) {
                  return 'O campo não pode ser vazio';
                }
                return null;
              },
              style: const TextStyle(
                fontSize: 20,
                color: AppStyle.colorCyanEightHundred,
              ),
            ),
            TextFormField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CPF',
                labelStyle: TextStyle(
                  color: AppStyle.colorCyanNineHundred,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'O campo não pode ser vazio';
                }
                if (!CPFValidator.isValid(value)) {
                  return 'CPF inválido';
                }
                return null;
              },
              style: const TextStyle(
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
              validator: (value) {
                if (value.isEmpty) {
                  return 'O campo não pode ser vazio';
                } else {
                  if (!emailregex.hasMatch(value)) {
                    return 'Email inválido';
                  }
                }
                return null;
              },
              style: const TextStyle(
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
              validator: (value) {
                if (value.isEmpty) {
                  return 'O campo não pode ser vazio';
                }
                return null;
              },
              style: const TextStyle(
                fontSize: 20,
                color: AppStyle.colorCyanEightHundred,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppStyle.colorCyan,
                borderRadius: BorderRadius.all(Radius.circular(60)),
              ),
              child: SizedBox(
                child: FlatButton(
                  child: Container(
                    child: const Text(
                      'Concluir',
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
      ),
    );
  }
}

class PessoaJuridica extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cnpjController = MaskedTextController(mask: '00.000.000/0000-00');
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    const Pattern emailpattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp emailregex = RegExp(emailpattern);

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
            child: Form(
              key: _formKey,
              autovalidate: true,
              onChanged: () => _formKey.currentState.validate(),
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'O campo não pode ser vazio';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppStyle.colorCyanEightHundred,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Razão social',
                      labelStyle: TextStyle(
                        color: AppStyle.colorCyanNineHundred,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'O campo não pode ser vazio';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppStyle.colorCyanEightHundred,
                    ),
                  ),
                  TextFormField(
                    controller: _cnpjController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CNPJ',
                      labelStyle: TextStyle(
                        color: AppStyle.colorCyanNineHundred,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'O campo não pode ser vazio';
                      } else {
                        if (!CNPJValidator.isValid(value)) {
                          return 'CNPJ inválido';
                        }
                        if (!emailregex.hasMatch(value)) {
                          return 'Email inválido';
                        }
                      }
                      return null;
                    },
                    style: const TextStyle(
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'O campo não pode ser vazio';
                      }
                      return null;
                    },
                    style: const TextStyle(
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'O campo não pode ser vazio';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppStyle.colorCyanEightHundred,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppStyle.colorCyan,
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                    ),
                    child: SizedBox(
                      child: FlatButton(
                        child: Container(
                          child: const Text(
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
    return DefaultTabController(
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
    );
  }
}
