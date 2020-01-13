import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/utils/style.dart';




class HomePage extends StatefulWidget {
  
  var anuncios = new List<Anuncios>();

  HomePage(){

    anuncios = [];
    anuncios.add(Anuncios(title: "Cachorro filhote", sexo: "Macho", favorito: false));
    anuncios.add(Anuncios(title: "Gato filhote", sexo: "Macho", favorito: false));
    anuncios.add(Anuncios(title: "Cachorro adulto", sexo: "Macho", favorito: false));

  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  Widget build(BuildContext context) {
      return Scaffold(
          body: ListView.separated(
            padding: EdgeInsets.all(8),
            itemCount: widget.anuncios.length,
            itemBuilder: (context, index){
            final anuncio = widget.anuncios[index];
    
              return Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage('https://pbs.twimg.com/media/DySmEisVYAI0YIb.jpg'),
                            ),
                        
                        title: Text(anuncio.title, textScaleFactor: 1.5),
                        subtitle: Text(anuncio.sexo,  textScaleFactor: 1.0),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('Ver Mais'),
                            color: AppStyle.colorCyanNineHundred,
                            onPressed: () => print('vermais'),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite),
                            color: Colors.red,
                            onPressed: () => print('favoritado'),
                          ),
                        ],
                      )
                    ],
                  )
                )
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
      );
  }
}

