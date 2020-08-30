part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ManangeNotificationsInProgress extends SettingsState {
  final bool chalkFinishedState;
  final bool yourTurnState;
  final bool removeAdsState;
  ManangeNotificationsInProgress({
    @required this.chalkFinishedState,
    @required this.yourTurnState,
    @required this.removeAdsState,
  });
}

class ChalkFinishedNotificationState extends SettingsState {}

class YourTurnNotificationState extends SettingsState {}
