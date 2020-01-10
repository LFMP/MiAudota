import 'package:flutter/material.dart';
import 'package:miaudota_app/pages/home_page.dart';
import 'package:miaudota_app/utils/style.dart';
import 'dart:async';
import 'dart:ui' as prefix0;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miaudota_app/models/modelo_Item.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/pages/cadastro_animal.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';

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
            child: ListTile(
              trailing: IconButton(
                color: AppStyle.colorBlack,
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () => Navigator.of(context).push(
                  SlideRoute(
                    page: AjudaCadastro(),
                    direction: SlideDirection.RIGHT_LEFT,
                  ),
                ),
              ),
              title: const Text('Cadastro'),
              subtitle: const Text('como fazer o cadastro.'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: IconButton(
                color: AppStyle.colorBlack,
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () => Navigator.of(context).push(
                  SlideRoute(
                    page: AjudaLogin(),
                    direction: SlideDirection.RIGHT_LEFT,
                  ),
                ),
              ),
              title: const Text('Login'),
              subtitle: const Text('como fazer o login.'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: IconButton(
                color: AppStyle.colorBlack,
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () => Navigator.of(context).push(
                  SlideRoute(
                    page: AjudaCadastroAnimal(),
                    direction: SlideDirection.RIGHT_LEFT,
                  ),
                ),
              ),
              title: const Text('Cadastro de Animal'),
              subtitle: const Text('como fazer o cadastro de animais.'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: IconButton(
                color: AppStyle.colorBlack,
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () => Navigator.of(context).push(
                  SlideRoute(
                    page: AjudaCadastroItem(),
                    direction: SlideDirection.RIGHT_LEFT,
                  ),
                ),
              ),
              title: const Text('Cadastro de Itens'),
              subtitle: const Text('como fazer o cadastro de itens.'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: IconButton(
                color: AppStyle.colorBlack,
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () => Navigator.of(context).push(
                  SlideRoute(
                    page: AjudaPerfil(),
                    direction: SlideDirection.RIGHT_LEFT,
                  ),
                ),
              ),
              title: const Text('Perfil'),
              subtitle: const Text('como editar o perfil.'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: IconButton(
                color: AppStyle.colorBlack,
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () => Navigator.of(context).push(
                  SlideRoute(
                    page: AjudaEntidade(),
                    direction: SlideDirection.RIGHT_LEFT,
                  ),
                ),
              ),
              title: const Text('Entidade'),
              subtitle: const Text('o que é uma entidade e seus privilégios.'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: IconButton(
                color: AppStyle.colorBlack,
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () => Navigator.of(context).push(
                  SlideRoute(
                    page: AjudaPessoaFisica(),
                    direction: SlideDirection.RIGHT_LEFT,
                  ),
                ),
              ),
              title: const Text('Pessoa física'),
              subtitle:
                  const Text('o que é uma pessoa física e seus privilégios.'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: IconButton(
                color: AppStyle.colorBlack,
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () => Navigator.of(context).push(
                  SlideRoute(
                    page: AjudaOutros(),
                    direction: SlideDirection.RIGHT_LEFT,
                  ),
                ),
              ),
              title: const Text('Outros'),
              subtitle: const Text('outras categorias de dúvidas.'),
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
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
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
              textAlign: (TextAlign.justify),
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
              textAlign: (TextAlign.justify),
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
              textAlign: (TextAlign.justify),
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
          padding: EdgeInsets.only(left: 15.0, right: 20.0),
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
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '2. Após isso você será direcionado para a página de cadastro do item.\n\n3. Preencha os campos respeitando as regras:\n \n\t\t- O título deve ter mais que 5 caracteres e menos que 40\n\n\t\t- A descrição tem que ter entre 25 e 200 caracteres\n\n\t\t- A quantidade deve ser um número de até 6 dígitos',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
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
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}

class AjudaCadastroAnimal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ajuda com o cadastro de um Animal',
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
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              'Como realizar o cadastro de um Animal',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '1. No menu do aplicativo, clique no botão "cadastrar Animal".',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '2. Após isso você será direcionado para a página de cadastro do Animal.\n',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/cadastroAnimal.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '3. Preencha seus dados nos campos.',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '4. Ao clicar no botão indicado é possível carregar uma imagem para o anúncio.',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/cadastroAnimal2.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '5. Clique no botão cadastrar para finalizar.',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 600,
              height: 350,
              child: Image.asset('assets/cadastroAnimal1.jpeg'),
            ),
            const SizedBox(
              height: 35,
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
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
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
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '2. Clique nos campos e preencha com seu usuário e senha',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
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
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '5. Caso você não possua um cadastro, clique no botão "Cadastrar-se".',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: (TextAlign.justify),
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
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
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
              textAlign: (TextAlign.justify),
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
              textAlign: (TextAlign.justify),
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
              textAlign: (TextAlign.justify),
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
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}

class AjudaOutros extends StatelessWidget {
  final ajudaO = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Outros',
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
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              'Outros tipos de ajuda',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Ops, ainda não possuímos nenhum tópico nesta página!',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Estamos abertos a sugestões de tópicos para ajuda, deixe aqui sua sugertão.',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 600,
              height: 100,
              child: TextField(
                controller: ajudaO,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Escreva aqui sua sugestão',
                  labelStyle: TextStyle(
                    color: AppStyle.colorCyanNineHundred,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                maxLength: 100,
                style: TextStyle(
                  fontSize: 20,
                  color: AppStyle.colorCyanEightHundred,
                ),
              ),
            ),
            Container(
              width: 50,
              decoration: BoxDecoration(
                color: AppStyle.colorCyan,
                borderRadius: const BorderRadius.all(Radius.circular(60)),
              ),
              child: FlatButton(
                child: Container(
                  child: Text(
                    'Enviar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppStyle.colorWhite,
                    ),
                  ),
                ),
                onPressed: () => {alertaD(context)},
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}

alertaD(BuildContext context) {
  // configura o button
  Widget botaoOK = FlatButton(
      child: Text("OK"),
      onPressed: () => {
            Navigator.of(context).pop(),
            Navigator.of(context).pop(),
          });
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Sugestão cadastrada com sucesso!"),
    content: Text("Muito obrigado pela contribuição."),
    actions: [
      botaoOK,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

class AjudaEntidade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Entidades',
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
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              'O que é uma entidade?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Uma entidade é uma pessoa jurídica, como por exemplo uma ONG.',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '\nQual a diferença entre uma pessoa física e uma entidade?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '1. A entidade se cadastra pelo CNPJ, enquanto a pessoa física se cadastra pelo CPF.\n\n2. A entidade se cadastra para divulgar diversos animais.\n\n3. A entidade faz a solicitação de itens necessitados.',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}

class AjudaPessoaFisica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pessoa Física',
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
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              'O que é uma Pessoa física?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Uma pessoa física é uma pessoa comum que possui CPF.',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '\nQual a diferença entre uma pessoa física e uma entidade?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: (TextAlign.center),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '1. A entidade se cadastra pelo CNPJ, enquanto a pessoa física se cadastra pelo CPF.\n\n2. A pessoa física se cadastra para divulgar ou adotar algum animal.\n\n3. A pessoa física pode fazer a doação de itens para as entidades.',
              style: TextStyle(fontSize: 20),
              textAlign: (TextAlign.justify),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
