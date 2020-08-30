part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class SettingsDropDownPressed extends SettingsEvent {}

class SettingsCloseNotificationsPressed extends SettingsEvent {}

class ChalkFinishedNotificationPressed extends SettingsEvent {
  final bool chalkFinishedBool;
  ChalkFinishedNotificationPressed({
    @required this.chalkFinishedBool,
  });
}

class YourTurnNotificationPressed extends SettingsEvent {
  final bool yourTurnBool;
  YourTurnNotificationPressed({
    @required this.yourTurnBool,
  });
}

class RemoveAdsPressed extends SettingsEvent {
  final bool removeAdsBool;
  RemoveAdsPressed({
    @required this.removeAdsBool,
  });
}
