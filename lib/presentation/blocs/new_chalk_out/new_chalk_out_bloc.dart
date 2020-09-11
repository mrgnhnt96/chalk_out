import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_words/random_words.dart';

part 'new_chalk_out_event.dart';
part 'new_chalk_out_state.dart';

class NewChalkOutBloc extends Bloc<NewChalkOutEvent, NewChalkOutState> {
  NewChalkOutBloc() : super(NewChalkOutInitial());

  @override
  Stream<NewChalkOutState> mapEventToState(
    NewChalkOutEvent event,
  ) async* {
    String randomWord;
    if (event is NewChalkOutClosePressed) {
      yield NewChalkOutCancelled();
    } else if (event is NewRandomWordPressed) {
      generateNoun().take(1).forEach((element) {
        randomWord = element.toString();
      });
      yield NewRandomWordLoaded(randomWord: randomWord);
    }
  }
}
