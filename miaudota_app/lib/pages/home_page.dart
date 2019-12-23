import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/pages/cadastro_animal.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';

class HomePage extends StatefulWidget {
  var anuncios = new List<Anuncio>();

  HomePage() {
    // anuncios = [];
    // anuncios.add(
    // Anuncios(title: "Cachorro filhote", sexo: "Macho", favorito: false));
    // anuncios
    // .add(Anuncios(title: "Gato filhote", sexo: "Macho", favorito: false));
    // anuncios.add(
    // Anuncios(title: "Cachorro adulto", sexo: "Macho", favorito: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                'Home Page',
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
          anuncios = state.anuncios;
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Home Page',
                  style: TextStyle(
                    color: AppStyle.colorWhite,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      SlideRoute(
                        page: CadastroAnimalPage(),
                        direction: SlideDirection.RIGHT_LEFT,
                      ),
                    ),
                    icon: Icon(Icons.call_to_action),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    title: Text('Business'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    title: Text('School'),
                  ),
                ],
                selectedItemColor: Colors.amber[800],
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
