import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';

class AnuncioPage extends StatelessWidget {  // StatelessWidget é um Widget que não armazena dados)
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final photoController = TextEditingController();
  final dateController = TextEditingController();
  final qtdController = TextEditingController();
  final qtdatualController = TextEditingController();
   @override
   
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            controller: dateController,
            keyboardType: TextInputType.text,
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
            controller: qtdController,
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
            controller: qtdatualController,
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
           onPressed: () => print('foto'),
           tooltip: 'photo',
           child: Icon(Icons.photo),
         ),
          const SizedBox(
            height: 30,
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
                onPressed: () => print('Cadastrar animal'),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
          