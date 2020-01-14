import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/pages/home_page.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

class AnuncioItemPage extends StatefulWidget {
  const AnuncioItemPage({this.anuncio}) : super();
  final Anuncio anuncio;

  @override
  _AnuncioItemPageState createState() => _AnuncioItemPageState();
}

class _AnuncioItemPageState extends State<AnuncioItemPage> {
  AnuncioBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AnuncioBloc>(context);
    bloc.add(AnuncioLoad());
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(
        title: const Text(
          'Doar Item',
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
                image: MemoryImage(base64Decode(widget.anuncio.foto)),
              ),
            ],
          ),
          Container(
            child: Text(
              widget.anuncio.descricao,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, height: 2),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              title: Text('Descrição: '),
              subtitle: Text(widget.anuncio.descricao),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              title: Text('Quantidade solicitado: '),
              subtitle: Text((widget.anuncio.item.qtdsolicitado).toString()),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              title: Text('Quantidade atual: '),
              subtitle:
                  Text((widget.anuncio.item.qtdsolicitado - 5).toString()),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
                title: Text('Data: '),
                subtitle: Text((widget.anuncio.data).toString())),
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
                  'Doar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppStyle.colorWhite,
                  ),
                ),
              ),
              onPressed: () => print("Doado"),
            ),
          ),
        ]).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          (bloc.add(
            AnuncioDelete(item: widget.anuncio),
          )),
          Navigator.of(context).push(
            SlideRoute(
              direction: SlideDirection.RIGHT_LEFT,
              page: HomePage(),
            ),
          )
        },
        child: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        backgroundColor: AppStyle.colorWhite,
      ),
    );
  }
}
