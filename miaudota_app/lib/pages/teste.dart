import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:ui' as prefix0;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miaudota_app/main.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

void main() => runApp(new teste());

class teste extends StatefulWidget {
  @override
  _testeState createState() => _testeState();
}

class _testeState extends State<teste> {
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
          maxLength: 150,
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
          keyboardType: TextInputType.text,
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
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(patttern);
    if (value.length == 0) {
      return "Informe o titulo do anuncio";
    } else if (!regExp.hasMatch(value)) {}
    return null;
  }

  String _validarDescricao(String value) {
    if (value.length == 0) {
      return "Informe a descricao";
    } else if (value.length < 10) {
      return "Descricao muito curta!";
    }

    return null;
  }

  String _validarQuantidade(String value) {
    String pattern = r'(^[a-zA-Z1-9]*$)';

    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe a quantidade";
    } else {
      return null;
    }
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Titulo $titulo");
      print("Descricao $descricao");
      print("Quantidade $quantidade");
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}
