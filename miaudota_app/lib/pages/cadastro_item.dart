import 'dart:async';
import 'dart:ui' as prefix0;
import 'dart:io';

import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/main.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/pages/ajuda_page.dart';

import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miaudota_app/models/modelo_Item.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroItem extends StatefulWidget {
  CadastroItem();
  @override
  _CadastroItemState createState() => _CadastroItemState();
}

class _CadastroItemState extends State<CadastroItem> {
  AnuncioBloc bloc;

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
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AnuncioBloc>(context);
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
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).push(
              SlideRoute(
                page: AjudaCadastroItem(),
                direction: SlideDirection.RIGHT_LEFT,
              ),
            ),
            color: AppStyle.colorWhite,
            icon: Icon(Icons.help),
          )
        ],
      ),
      body: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is AnuncioLoadedState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Cadastro realizado!"),
                  content:
                      Text("Seu cadastro de Item foi realizado com sucesso."),
                  actions: [
                    FlatButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }),
                  ],
                );
              },
            );
          }
        },
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is AnuncioLoadingState)
              return Center(child: CircularProgressIndicator());

            return Container(
                padding: AppStyle.padding,
                color: AppStyle.colorWhite,
                child: Form(
                  key: _key,
                  autovalidate: _validate,
                  child: _formUI(),
                ));

            // /
            // import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data'

            // Image.memory(base64Decode(anuncio.foto));
          },
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
    } else if (value.length <= 5) {
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
      final Item meuItem = Item(
          qtdatual: int.parse(quantidade),
          qtdsolicitado: int.parse(quantidade));

      Anuncio anuncio = Anuncio(
          item: meuItem,
          titulo: titulo,
          descricao: descricao,
          data: DateTime.now(),
          foto: base64Encode(_imagem.readAsBytesSync()));

      bloc.add(AnuncioCreate(item: anuncio));
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}
