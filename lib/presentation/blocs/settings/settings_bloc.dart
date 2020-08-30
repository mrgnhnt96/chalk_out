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
  static bool removeAdsState = false;

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsDropDownPressed) {
      yield ManangeNotificationsInProgress(
        chalkFinishedState: chalkFinishedState,
        yourTurnState: yourTurnState,
        removeAdsState: removeAdsState,
      );
    } else if (event is SettingsCloseNotificationsPressed) {
      yield SettingsInitial();
    } else if (event is ChalkFinishedNotificationPressed) {
      chalkFinishedState = event.chalkFinishedBool;
      yield ManangeNotificationsInProgress(
        chalkFinishedState: chalkFinishedState,
        yourTurnState: yourTurnState,
        removeAdsState: removeAdsState,
      );
    } else if (event is YourTurnNotificationPressed) {
      yourTurnState = event.yourTurnBool;
      yield ManangeNotificationsInProgress(
        chalkFinishedState: chalkFinishedState,
        yourTurnState: yourTurnState,
        removeAdsState: removeAdsState,
      );
    } else if (event is RemoveAdsPressed) {
      removeAdsState = event.removeAdsBool;
      yield ManangeNotificationsInProgress(
        chalkFinishedState: chalkFinishedState,
        yourTurnState: yourTurnState,
        removeAdsState: removeAdsState,
      );
    }
  }
}
