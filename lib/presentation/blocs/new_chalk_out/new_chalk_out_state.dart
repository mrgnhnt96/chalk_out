part of 'new_chalk_out_bloc.dart';

@immutable
abstract class NewChalkOutState {}

class NewChalkOutInitial extends NewChalkOutState {}

class NewChalkOutCancelled extends NewChalkOutState {}

class NewRandomWordLoaded extends NewChalkOutState {
  final String randomWord;
  NewRandomWordLoaded({
    @required this.randomWord,
  });
}
