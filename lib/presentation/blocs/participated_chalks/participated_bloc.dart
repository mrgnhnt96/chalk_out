import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'participated_event.dart';
part 'participated_state.dart';

class ParticipatedBloc extends Bloc<ParticipatedEvent, ParticipatedState> {
  ParticipatedBloc() : super(ParticipatedInitial());

  @override
  Stream<ParticipatedState> mapEventToState(
    ParticipatedEvent event,
  ) async* {
    if (event is SettingButtonPressed) {
      yield SettingsPageInitial();
    } else if (event is SettingCloseButtonPressed) {
      yield ParticipatedInitial();
    } else if (event is NewChalkOutPressed) {
      yield NewChalkOutStart();
    }
  }
}
