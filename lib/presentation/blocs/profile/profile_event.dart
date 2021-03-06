part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class EditUsernamePressed extends ProfileEvent {}

class ProfileScreenStart extends ProfileEvent {
  ProfileScreenStart();
}

class EditUsernameCompleted extends ProfileEvent {
  final String newUsername;

  EditUsernameCompleted({@required this.newUsername});
}
