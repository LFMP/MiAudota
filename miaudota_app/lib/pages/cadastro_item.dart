import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';

class Item extends StatelessWidget {  // StatelessWidget é um Widget que não armazena dados)
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final photoController = TextEditingController();
  final dateController = TextEditingController();
  final qtdController = TextEditingController();
  final qtdatualController = TextEditingController();
   @override
   
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyle.padding,
      color: AppStyle.colorWhite,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: titleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Título do aníncio',
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
              labelText: 'Data',
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
              labelText: 'Quantidade atual',
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
            height: 20,
          ),
          FloatingActionButton(
           onPressed: () => print('foto'),
           tooltip: 'photo',
           child: Icon(Icons.add),
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
        ],
      ),
    );
  }
}
          