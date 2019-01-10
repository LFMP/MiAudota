import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/pages/home_page.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:miaudota_app/repositories/usuario.dart';

class ListaPage extends StatefulWidget {
  var anuncios = new List<Anuncio>();

  ListaPage() {
    // anuncios = [];
    // anuncios.add(
    // Anuncios(title: "Cachorro filhote", sexo: "Macho", favorito: false));
    // anuncios
    // .add(Anuncios(title: "Gato filhote", sexo: "Macho", favorito: false));
    // anuncios.add(
    // Anuncios(title: "Cachorro adulto", sexo: "Macho", favorito: false));
  }

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  AnuncioBloc bloc = AnuncioBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(AnuncioLoad());
  }

  @override
  Widget build(BuildContext context) {
    List<Anuncio> anuncios;
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is AnuncioLoadingState || state is AnuncioNotInitState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Pagina Principal',
                style: TextStyle(
                  color: AppStyle.colorWhite,
                ),
              ),
            ),
            body: Center(
              child: HomePage(),
            ),
          );
        }
        if (state is AnuncioLoadedState) {
          anuncios = state.anuncios;
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Pagina Principal',
                  style: TextStyle(
                    color: AppStyle.colorWhite,
                  ),
                ),
                actions: <Widget>[],
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
                                    icon: anuncio.id == 1
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
