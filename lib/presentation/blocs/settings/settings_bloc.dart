import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super();

  String username = 'Taylor Hunt';

  @override
  SettingsState get initialState {
    usernameController.text = username;
    return SettingsInitial(usernameController: usernameController);
  }

  static TextEditingController usernameController = TextEditingController();

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is EditUsernamePressed) {
      yield EditUsernameInProgress();
    } else if (event is EditUsernameCompleted) {
      if (event.newUsername.isNotEmpty) {
        usernameController.text = event.newUsername;
      }
      yield EditUsernameSuccess(newUsernameController: usernameController);
    } else if (event is SettingsDropDownPressed) {
      yield ManangeNotificationsInProgress();
    } else if (event is SettingsCloseNotificationsPressed) {
      yield SettingsInitial(usernameController: usernameController);
    }
  }
}
