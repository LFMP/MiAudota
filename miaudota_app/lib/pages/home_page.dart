import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/utils/style.dart';

class HomePage extends StatefulWidget {
  var anuncios = new List<Anuncios>();

  HomePage() {
    anuncios = [];
    anuncios.add(
        Anuncios(title: "Cachorro filhote", sexo: "Macho", favorito: false));
    anuncios
        .add(Anuncios(title: "Gato filhote", sexo: "Macho", favorito: false));
    anuncios.add(
        Anuncios(title: "Cachorro adulto", sexo: "Macho", favorito: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AnuncioBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AnuncioBloc>(context);
    _bloc.add(AnuncioLoad());
  }

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
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          Widget _child = Container();
          if (state is AnuncioLoadingState) {
            _child = CircularProgressIndicator();
          }
          if (state is AnuncioLoadedState) {
            _child = ListView.separated(
              padding: EdgeInsets.all(8),
              itemCount: widget.anuncios.length,
              itemBuilder: (context, index) {
                final anuncio = widget.anuncios[index];

                return Container(
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
                      title: Text(anuncio.title, textScaleFactor: 1.5),
                      subtitle: Text(anuncio.sexo, textScaleFactor: 1.0),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver Mais'),
                          color: AppStyle.colorCyanNineHundred,
                          onPressed: () => print('vermais'),
                        ),
                        IconButton(
                          icon: anuncio.favorito
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              anuncio.favorito = !anuncio.favorito;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                )));
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          }
          return _child;
        },
      ),
    );
  }
}
