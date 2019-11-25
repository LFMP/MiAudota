import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miaudota_app/utils/style.dart';

class PessoaFisica extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    'Próximo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppStyle.colorWhite,
                    ),
                  ),
                ),
                onPressed: () => print('próximo'),
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
                onPressed: () => print('próximo'),
              ),
            ),
          ),
        ],
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
