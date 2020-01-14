import 'package:equatable/equatable.dart';
import 'package:miaudota_app/models/anuncios.dart';

abstract class AnuncioEvent extends Equatable {
  List get props => [];
}

class AnuncioLoad extends AnuncioEvent {}

class AnuncioCreate extends AnuncioEvent {
  final String titulo;
  final String descricao;
  final String raca;
  final String idade;
  final String sexo;
  final String porte;
  AnuncioCreate(
      {this.titulo,
      this.descricao,
      this.raca,
      this.idade,
      this.sexo,
      this.porte});
}
