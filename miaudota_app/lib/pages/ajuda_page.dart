import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';
import 'dart:async';
import 'dart:ui' as prefix0;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miaudota_app/main.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miaudota_app/models/modelo_Item.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AjudaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajuda',
          style: TextStyle(
            color: AppStyle.colorWhite,
          ),
        ),
        leading: IconButton(
          onPressed: () =>
              Navigator.of(context).pop(), //para voltar para a tela anterior
          color: AppStyle.colorWhite,
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            child: const ListTile(
              trailing: IconButton(
                color: AppStyle.colorWhite,
                icon: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Cadastro'),
              subtitle: Text('como fazer o cadastro.'),
            ),
          ),
          Card(
            child: const ListTile(
              trailing: IconButton(
                color: AppStyle.colorWhite,
                icon: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Login'),
              subtitle: Text('como fazer o login.'),
            ),
          ),
          Card(
            child: const ListTile(
              trailing: IconButton(
                color: AppStyle.colorWhite,
                icon: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Cadastro de Animal'),
              subtitle: Text('como fazer o cadastro de animais.'),
            ),
          ),
          Card(
            child: const ListTile(
              trailing: IconButton(
                color: AppStyle.colorWhite,
                icon: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Cadastro de Itens'),
              subtitle: Text('como fazer o cadastro de itens.'),
            ),
          ),
          Card(
            child: const ListTile(
              trailing: IconButton(
                color: AppStyle.colorWhite,
                icon: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Perfil'),
              subtitle: Text('como editar o perfil.'),
            ),
          ),
          Card(
            child: const ListTile(
              trailing: IconButton(
                color: AppStyle.colorWhite,
                icon: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Entidade'),
              subtitle: Text('o que é uma entidade e seus privilégios'),
            ),
          ),
          Card(
            child: const ListTile(
              trailing: IconButton(
                color: AppStyle.colorWhite,
                icon: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Pessoa física'),
              subtitle: Text('o que é uma pessoa física e seus privilégios.'),
            ),
          ),
          Card(
            child: const ListTile(
              trailing: IconButton(
                color: AppStyle.colorWhite,
                icon: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Outros'),
              subtitle: Text('outras categorias de dúvidas.'),
            ),
          ),
        ],
      ),
    );
  }
}

class AjudaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ajuda com o cadastro',
            style: TextStyle(
              color: AppStyle.colorWhite,
            ),
          ),
          leading: IconButton(
            onPressed: () =>
                Navigator.of(context).pop(), //para voltar para a tela anterior
            color: AppStyle.colorWhite,
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              'Como realizar o cadastro',
              style: TextStyle(fontSize: 25, fontStyle: Bold()),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Na página inicial do aplicativo, clique no botão cadastrar-se.',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/cadastroTinicial.jpg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Após isso você será direcionado para a página de cadastro.\n\nSelecione qual tipo de pessoa você é: Pessoa Física ou Jurídica',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/cadastro.jpg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Preencha seus dados nos campos indicados e clique no botão concluir.',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
