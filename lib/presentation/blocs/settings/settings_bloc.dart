import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial(removeAdsBool: _removeAdsBool));

  static bool _chalkFinishedBool = true;
  static bool _yourTurnBool = true;
  static bool _removeAdsBool = false;

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsDropDownPressed) {
      yield ManangeNotificationsInProgress(
        chalkFinishedBool: _chalkFinishedBool,
        yourTurnBool: _yourTurnBool,
        removeAdsBool: _removeAdsBool,
      );
    } else if (event is SettingsCloseNotificationsPressed) {
      yield SettingsInitial(removeAdsBool: _removeAdsBool);
    } else if (event is ChalkFinishedNotificationPressed) {
      _chalkFinishedBool = event.chalkFinishedBool;
      yield ManangeNotificationsInProgress(
        chalkFinishedBool: _chalkFinishedBool,
        yourTurnBool: _yourTurnBool,
        removeAdsBool: _removeAdsBool,
      );
    } else if (event is YourTurnNotificationPressed) {
      _yourTurnBool = event.yourTurnBool;
      yield ManangeNotificationsInProgress(
        chalkFinishedBool: _chalkFinishedBool,
        yourTurnBool: _yourTurnBool,
        removeAdsBool: _removeAdsBool,
      );
    } else if (event is RemoveAdsPressed) {
      _removeAdsBool = event.removeAdsBool;
      yield SettingsInitial(
        removeAdsBool: _removeAdsBool,
      );
    }
  }
}
