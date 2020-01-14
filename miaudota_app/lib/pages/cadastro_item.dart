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

class CadastroItem extends StatefulWidget {
  var anuncios_itens = List<Item>();

  CadastroItem() {
    anuncios_itens = [];
  }
  @override
  _CadastroItemState createState() => _CadastroItemState();
}

class _CadastroItemState extends State<CadastroItem> {
  final titleController = TextEditingController();

  final descController = TextEditingController();

  final photoController = TextEditingController();

  final dateController = TextEditingController();

  final qtdController = TextEditingController();

  final qtdatualController = TextEditingController();

  File _imagem;
  Future getImage() async {
    var imagem = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imagem = imagem;
    });
  }

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String titulo, descricao, quantidade;

  Future load() async {
    // assincrona porque não recupera as informações em tempo real
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded
          .map((x) => Item.fromJson(x))
          .toList(); //map percorre os itens, essa linha é como um forit
      setState(() {
        widget.anuncios_itens = result;
      });
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.anuncios_itens));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Item',
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
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            color: AppStyle.colorWhite,
            icon: Icon(Icons.help),
          )
        ],
      ),
      body: Container(
        padding: AppStyle.padding,
        color: AppStyle.colorWhite,
        child: Form(
          key: _key,
          autovalidate: _validate,
          child: _formUI(),
        ),
      ),
    );
  }

  Widget _formUI() {
    return ListView(
      children: <Widget>[
        TextFormField(
          controller: titleController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Título do anúncio do item',
            labelStyle: TextStyle(
              color: AppStyle.colorCyanNineHundred,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          maxLength: 40,
          validator: _validarTitulo,
          onSaved: (String val) {
            titulo = val;
          },
          style: TextStyle(
            fontSize: 20,
            color: AppStyle.colorCyanEightHundred,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: descController,
          keyboardType: TextInputType.text,
          maxLength: 200,
          decoration: InputDecoration(
            labelText: 'Descrição',
            labelStyle: TextStyle(
              color: AppStyle.colorCyanNineHundred,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          validator: _validarDescricao,
          onSaved: (String val) {
            descricao = val;
          },
          style: TextStyle(
            fontSize: 20,
            color: AppStyle.colorCyanEightHundred,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: qtdController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Quantidade',
            labelStyle: TextStyle(
              color: AppStyle.colorCyanNineHundred,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          maxLength: 40,
          validator: _validarQuantidade,
          onSaved: (String val) {
            quantidade = val;
          },
          style: TextStyle(
            fontSize: 20,
            color: AppStyle.colorCyanEightHundred,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingActionButton(
          onPressed: getImage,
          tooltip: 'photo',
          child: Icon(Icons.photo),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: _imagem == null ? Text('') : Image.file(_imagem),
        ),
        const SizedBox(
          height: 20,
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
                  'Cadastrar item',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppStyle.colorWhite,
                  ),
                ),
              ),
              onPressed: _sendForm,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  String _validarTitulo(String value) {
    String patttern = r'(^[a-zA-Z0-9 ]*$)';
    RegExp regExp = RegExp(patttern);
    if (value.length == 0) {
      return "Informe o titulo do anuncio";
    } else if (value.length < 5) {
      return "Título muito curto";
    }
    return null;
  }

  String _validarDescricao(String value) {
    if (value.length == 0) {
      return "Informe a descricao";
    } else if (value.length < 25) {
      return "Descricao muito curta!";
    }

    return null;
  }

  String _validarQuantidade(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return "Informe a quantidade";
    } else if (!regExp.hasMatch(value)) {
      return "A quantidade deve conter somente números";
    } else if (value.length > 6) {
      return "Retorne um numero com menos digitos";
    }
    return null;
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      widget.anuncios_itens.add(Item(
        titulo: titulo,
        descricao: descricao,
        quantidade: quantidade,
        qtdAtual: quantidade,
        data: DateTime.now(),
      ));
      print("Titulo $titulo");
      print("Descricao $descricao");
      print("Quantidade $quantidade");
      save();
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}
