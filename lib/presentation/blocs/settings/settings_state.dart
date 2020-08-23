part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {
  final TextEditingController usernameController;

  SettingsInitial({@required this.usernameController});
}

class EditUsernameInProgress extends SettingsState {
  // final TextEditingController newUsernameController;

  // EditUsernameInProgress({@required this.newUsernameController});
}

class EditUsernameSuccess extends SettingsState {
  final TextEditingController newUsernameController;

  EditUsernameSuccess({@required this.newUsernameController});
}

class ManangeNotificationsInProgress extends SettingsState {
  // final TextEditingController currentUsernameController;

  // ManangeNotificationsInProgress({@required this.currentUsernameController});
}
