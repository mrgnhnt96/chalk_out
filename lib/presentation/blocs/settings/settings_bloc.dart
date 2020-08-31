import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super();

  @override
  SettingsState get initialState => SettingsInitial(removeAdsBool: removeAdsState);

  static bool chalkFinishedState = true;
  static bool yourTurnState = true;
  static bool removeAdsState = false;

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsDropDownPressed) {
      yield ManangeNotificationsInProgress(
        chalkFinishedBool: chalkFinishedState,
        yourTurnBool: yourTurnState,
        removeAdsBool: removeAdsState,
      );
    } else if (event is SettingsCloseNotificationsPressed) {
      yield SettingsInitial(removeAdsBool: removeAdsState);
    } else if (event is ChalkFinishedNotificationPressed) {
      chalkFinishedState = event.chalkFinishedBool;
      yield ManangeNotificationsInProgress(
        chalkFinishedBool: chalkFinishedState,
        yourTurnBool: yourTurnState,
        removeAdsBool: removeAdsState,
      );
    } else if (event is YourTurnNotificationPressed) {
      yourTurnState = event.yourTurnBool;
      yield ManangeNotificationsInProgress(
        chalkFinishedBool: chalkFinishedState,
        yourTurnBool: yourTurnState,
        removeAdsBool: removeAdsState,
      );
    } else if (event is RemoveAdsPressed) {
      removeAdsState = event.removeAdsBool;
      yield SettingsInitial(
        removeAdsBool: removeAdsState,
      );
    }
  }
}
