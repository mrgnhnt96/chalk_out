part of 'new_chalk_out_bloc.dart';

@immutable
abstract class NewChalkOutEvent {}

class NewChalkOutClosePressed extends NewChalkOutEvent {
  List<Object> get props => [];
}

class NewRandomWordPressed extends NewChalkOutEvent {
  List<Object> get props => [];
}

class ChalkItPressed extends NewChalkOutEvent {
  final String chalkItWord;
  ChalkItPressed({
    @required this.chalkItWord,
  });
  List<Object> get props => [];
}

class CloseShipItPressed extends NewChalkOutEvent {
  final String chalkItWord;
  CloseShipItPressed({
    @required this.chalkItWord,
  });
  List<Object> get props => [];
}
