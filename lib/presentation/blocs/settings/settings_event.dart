part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class SettingsDropDownPressed extends SettingsEvent {}

class SettingsCloseNotificationsPressed extends SettingsEvent {}
