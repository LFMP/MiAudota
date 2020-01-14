import 'dart:async';
import 'dart:ui' as prefix0;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miaudota_app/main.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';

class CadastroItem extends StatefulWidget {
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
        child: ListView(
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
              validator: (value) {
                if (value.isEmpty) {
                  return 'O campo não pode ser vazio';
                }
                return null;
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
              decoration: InputDecoration(
                labelText: 'Descrição',
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
              validator: (value) {
                if (value.isEmpty) {
                  return 'O campo não pode ser vazio';
                }
                return null;
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
                  onPressed: () => print('Cadastrar item'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
