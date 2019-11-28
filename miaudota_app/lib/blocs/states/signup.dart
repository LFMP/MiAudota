import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SignUPState extends Equatable {
  const SignUPState();

  @override
  List<Object> get props => [];
}

class SignUPInitial extends SignUPState {}

class SignUPLoading extends SignUPState {}

class SignUPFailure extends SignUPState {
  const SignUPFailure({@required this.error});
  final String error;

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SignUPFailure { error: $error }';
}
