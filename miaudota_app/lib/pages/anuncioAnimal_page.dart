import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';

class AnimalPage extends StatefulWidget {
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  final titleController = TextEditingController();
  final racaController = TextEditingController();
  final idadeController = TextEditingController();
  final photoController = TextEditingController();
  final sexoController = TextEditingController();
  final porteController = TextEditingController();
  final descController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String _image;
  Future<void> setImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    final String encoded = base64Encode(image.readAsBytesSync());
    setState(() {
      _image = encoded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(
        title: const Text(
          'Adotar Animal',
          style: TextStyle(
            color: AppStyle.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () =>
              Navigator.of(context).pop(), //para voltar para a tela anterior
          color: AppStyle.colorWhite,
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: AppStyle.colorCyan,
      ),
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                color: Colors.cyan[200],
              ),
              Image(
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(
                    'https://pbs.twimg.com/media/DySmEisVYAI0YIb.jpg'),
              ),
            ],
          ),
          Container(
            child: Text(
              'TITULO',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, height: 2),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              title: Text('Descrição:'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              title: Text('Raça: '),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              title: Text('Sexo: '),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              title: Text('Porte: '),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 100, right: 100, top: 18),
            child: FlatButton(
              color: AppStyle.colorCyanEightHundred,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: AppStyle.colorCyanEightHundred),
              ),
              child: Container(
                child: const Text(
                  'Adotar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppStyle.colorWhite,
                  ),
                ),
              ),
              onPressed: () => print("ADOTADO"),
            ),
          ),
        ]).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        child: Icon(
          Icons.favorite_border,
          color: Colors.red,
        ),
        backgroundColor: AppStyle.colorWhite,
      ),
    );
  }
}
