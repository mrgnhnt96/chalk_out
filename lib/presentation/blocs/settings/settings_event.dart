part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class EditUsernamePressed extends SettingsEvent {}

class EditUsernameCompleted extends SettingsEvent {
  final String newUsername;

  EditUsernameCompleted({@required this.newUsername});
}

class SettingsDropDownPressed extends SettingsEvent {}

class SettingsCloseNotificationsPressed extends SettingsEvent {}
