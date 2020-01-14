import 'dart:io';
import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';

class CadastroAnimalPage extends StatefulWidget {
  @override
  _AnimalState createState() => _AnimalState();
}

class _AnimalState extends State<CadastroAnimalPage> {
  final titleController = TextEditingController();
  final racaController = TextEditingController();
  final idadeController = TextEditingController();
  final photoController = TextEditingController();
  final sexoController = TextEditingController();
  final porteController = TextEditingController();
  final descController = TextEditingController();

  File _imagem;
  Future getImage() async {
    var imagem = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imagem = imagem;
    });
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Animal',
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
      body: Form(
        key: _formkey,
        child: Container(
          padding: AppStyle.padding,
          color: AppStyle.colorWhite,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Título do anúncio de animal',
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
                controller: racaController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Raça',
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
                controller: idadeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Idade',
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
                controller: sexoController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Sexo',
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
                controller: porteController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Porte',
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
              SizedBox(
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
                          'Cadastrar animal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppStyle.colorWhite,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Preencha este campo!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
