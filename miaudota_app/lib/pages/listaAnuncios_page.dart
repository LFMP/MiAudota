import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/pages/home_page.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:miaudota_app/repositories/usuario.dart';

class ListaPage extends StatefulWidget {
  var anuncios = new List<Anuncio>();

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  AnuncioBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AnuncioBloc>(context);
    bloc.add(AnuncioLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is AnuncioLoadingState || state is AnuncioNotInitState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Miaudota',
                textAlign: prefix0.TextAlign.center,
                style: TextStyle(
                  color: AppStyle.colorWhite,
                ),
              ),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is AnuncioLoadedState) {
          final anuncios = state.anuncios;
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Miaudota',
                  textAlign: prefix0.TextAlign.center,
                  style: TextStyle(
                    color: AppStyle.colorWhite,
                  ),
                ),
              ),
              body: ListView.separated(
                padding: EdgeInsets.all(8),
                itemCount: anuncios.length,
                itemBuilder: (context, index) {
                  final anuncio = anuncios[index];

                  return Column(
                    children: <Widget>[
                      Container(
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      'https://pbs.twimg.com/media/DySmEisVYAI0YIb.jpg'),
                                ),
                                title:
                                    Text(anuncio.titulo, textScaleFactor: 1.5),
                                subtitle: Text(anuncio.descricao,
                                    textScaleFactor: 1.0),
                              ),
                              ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text('Ver Mais'),
                                    color: AppStyle.colorCyanNineHundred,
                                    onPressed: () => print('vermais'),
                                  ),
                                  IconButton(
                                    icon: anuncio.animal.id != null ||
                                            anuncio.item.id != null
                                        ? Icon(Icons.favorite)
                                        : Icon(Icons.favorite_border),
                                    color: Colors.red,
                                    onPressed: null,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ));
        }
      },
    );
  }
}
