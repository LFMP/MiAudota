import 'package:equatable/equatable.dart';
import 'package:miaudota_app/models/anuncios.dart';

abstract class AnuncioEvent extends Equatable {
  List get props => [];
}

class AnuncioLoad extends AnuncioEvent {}

class AnuncioCreate extends AnuncioEvent {
  final Anuncio item;
  AnuncioCreate({this.item});

  @override
  List get props => [this.item];
}

class AnuncioDelete extends AnuncioEvent {
  final Anuncio item;
  AnuncioDelete({this.item});

  @override
  List get props => [this.item];
}
