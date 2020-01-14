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
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '1. Na página inicial do aplicativo, clique no botão cadastrar-se.',
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
              '2. Após isso você será direcionado para a página de cadastro.\n\n3. Selecione qual tipo de pessoa você é: Pessoa Física ou Jurídica',
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
              '4. Preencha seus dados nos campos indicados e clique no botão concluir.',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}

class AjudaCadastroItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ajuda com o cadastro de um Item',
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
              'Como realizar o cadastro de um Item',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '1. No menu do aplicativo, clique no botão "cadastrar item".',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '2. Após isso você será direcionado para a página de cadastro do item.\n\n3. Preencha os campos respeitando as regras:\n \n-O título deve ter mais que 5 caracteres e menos que 40\n\n -A descrição tem que ter entre 25 e 200 caracteres\n\n -A quantidade deve ser um número de até 6 dígitos',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/cadastroItem.jpg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '4. Preencha seus dados nos campos indicados e clique no botão Cadastrar item.',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}

class AjudaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ajuda com o Login',
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
              'Como realizar o login',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '1. Vá para a página inicial do aplicativo.',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '2. Clique nos campos e coloque seu usuário e senha',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/login.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '4. Clique no botão "Login".',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}

class AjudaPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ajuda no perfil',
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
              'Como editar o perfil',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '1. Vá para a página do seu perfil.',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/perfil.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '2. Selecione o campo indicado na imagem',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/perfilEdit.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '4. Para editar os campos telefone e endereço, selecione os botões e preencha os campos como mostra nas imagens.',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/perfilEnd.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/perfilPreencherEnd.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/perfilFone.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/PerfilPreenchfone.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '5. Clique no botão atualizar para salvar os dados.',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}
