import 'package:equatable/equatable.dart';
import 'package:miaudota_app/models/anuncios.dart';

abstract class AnuncioEvent extends Equatable {
  List get props => [];

}

class AnuncioLoad extends AnuncioEvent {

}

class AnuncioCreate extends AnuncioEvent {
  final Anuncios anuncio;
  AnuncioCreate({this.anuncio});
  List get props => [this.anuncio];
}