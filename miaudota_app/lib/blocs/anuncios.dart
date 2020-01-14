import 'dart:async';

export 'package:miaudota_app/blocs/events/anuncios.dart';
export 'package:miaudota_app/blocs/states/anuncios.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:miaudota_app/blocs/events/anuncios.dart';
import 'package:miaudota_app/blocs/states/anuncios.dart';
import 'package:miaudota_app/models/anuncios.dart';

class AnuncioBloc extends Bloc<AnuncioEvent, AnuncioState> {
  @override
  AnuncioState get initialState => AnuncioNotInitState();

  @override
  Stream<AnuncioState> mapEventToState(AnuncioEvent event) async* {
    if (event is AnuncioLoad) {
      final List<Anuncios> oldAnuncios = this.state is AnuncioLoadedState
          ? (this.state as AnuncioLoadedState).anuncios
          : [
              Anuncios(
                  title: "Miaudota item",
                  sexo: "Maxxxxculino",
                  porte: "VERY BIG LARGE DOG",
                  favorito: false)
            ];
      yield AnuncioLoadingState();
      //await Future.delayed(Duration(seconds: 10));
      yield AnuncioLoadedState(anuncios: oldAnuncios);
    }
    if (event is AnuncioCreate) {
      final List<Anuncios> oldAnuncios = this.state is AnuncioLoadedState
          ? (this.state as AnuncioLoadedState).anuncios
          : [];
      yield AnuncioLoadingState();
      oldAnuncios.add(event.anuncio);
      yield AnuncioLoadedState(anuncios: oldAnuncios);
    }
  }
}
