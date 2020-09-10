part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {
  final bool removeAdsBool;
  SettingsInitial({
    @required this.removeAdsBool,
  });
}

class ManangeNotificationsInProgress extends SettingsState {
  final bool chalkFinishedBool;
  final bool yourTurnBool;
  final bool removeAdsBool;
  ManangeNotificationsInProgress({
    @required this.chalkFinishedBool,
    @required this.yourTurnBool,
    @required this.removeAdsBool,
  });
}

class ChalkFinishedNotificationState extends SettingsState {}

class YourTurnNotificationState extends SettingsState {}
