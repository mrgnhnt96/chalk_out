part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class SettingsDropDownPressed extends SettingsEvent {}

class SettingsCloseNotificationsPressed extends SettingsEvent {}

class ChalkFinishedNotificationPressed extends SettingsEvent {}

class YourTurnNotificationPressed extends SettingsEvent {}
