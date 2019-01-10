import 'dart:async';

export 'package:miaudota_app/blocs/events/anuncios.dart';
export 'package:miaudota_app/blocs/states/anuncios.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:miaudota_app/blocs/events/anuncios.dart';
import 'package:miaudota_app/blocs/states/anuncios.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/repositories/anuncio.dart';

class AnuncioBloc extends Bloc<AnuncioEvent, AnuncioState> {
  final repo = AnuncioRepository();

  @override
  AnuncioState get initialState => AnuncioNotInitState();

  @override
  Stream<AnuncioState> mapEventToState(AnuncioEvent event) async* {
    if (event is AnuncioLoad) {
      yield AnuncioLoadingState();
      yield* _atualizarLista();
    }

    if (event is AnuncioCreate) {
      yield AnuncioLoadingState();
      try {
        final Anuncio response =
            await AnuncioRepository.createAnuncio(event.item);
        if (response != null)
          yield* _atualizarLista();
        else
          yield AnuncioErrorState(errormsg: "Erro!");
      } catch (e) {
        yield AnuncioErrorState(errormsg: e.toString());
      }

      if (event is AnuncioDelete) {
        yield AnuncioLoadingState();
        try {
          final bool response =
              await AnuncioRepository.deleteAnuncio(event.item);
          if (response)
            yield* _atualizarLista();
          else
            yield AnuncioErrorState(errormsg: "Erro!");
        } catch (e) {
          yield AnuncioErrorState(errormsg: e.toString());
        }
      }
    }

    // if (event is AnuncioCreate) {
    //   yield AnuncioLoadingState();
    //   try {
    //     final bool response = await repo.setAnuncios(event.titulo); ////aaaaaa
    //     yield SuccessCreateState();
    //   } catch (e) {
    //     yield AnuncioErrorState(errormsg: e.toString());
    //   }
    // }
  }

  Stream<AnuncioState> _atualizarLista() async* {
    try {
      final List<Anuncio> response = await repo.getAnuncios();
      yield AnuncioLoadedState(anuncios: response);
    } catch (e) {
      yield AnuncioErrorState(errormsg: e.toString());
    }
  }
}
