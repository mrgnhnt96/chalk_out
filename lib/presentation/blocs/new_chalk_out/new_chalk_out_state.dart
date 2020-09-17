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

class ChalkItFinished extends NewChalkOutState {
  final String randomWord;
  ChalkItFinished({
    @required this.randomWord,
  });
}

class ReselectChalkItWordInProgress extends NewChalkOutState {
  final String randomWord;
  ReselectChalkItWordInProgress({
    @required this.randomWord,
  });
}
