import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super();

  @override
  SettingsState get initialState => SettingsInitial();

  static bool chalkFinishedState = true;
  static bool yourTurnState = true;

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsDropDownPressed) {
      yield ManangeNotificationsInProgress(chalkFinishedState: chalkFinishedState, yourTurnState: yourTurnState);
    } else if (event is SettingsCloseNotificationsPressed) {
      yield SettingsInitial();
    }
  }
}
