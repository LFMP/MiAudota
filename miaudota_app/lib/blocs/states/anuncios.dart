import 'package:equatable/equatable.dart';
import 'package:miaudota_app/models/anuncios.dart';

abstract class AnuncioState extends Equatable {
  @override
  List<Object> get props => [];
}

class AnuncioNotInitState extends AnuncioState {}

class AnuncioLoadedState extends AnuncioState {
  final List<Anuncio> anuncios;
  AnuncioLoadedState({this.anuncios});
  @override
  List<Object> get props => [this.anuncios];
}

class AnuncioErrorState extends AnuncioState {
  final String errormsg;
  AnuncioErrorState({this.errormsg});
  @override
  List<Object> get props => [this.errormsg];
}

class AnuncioLoadingState extends AnuncioState {}
