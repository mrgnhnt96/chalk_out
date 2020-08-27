part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {
  final TextEditingController usernameController;

  ProfileInitial({@required this.usernameController});
}

class EditUsernameInProgress extends ProfileState {}

class EditUsernameSuccess extends ProfileState {
  final TextEditingController newUsernameController;

  EditUsernameSuccess({@required this.newUsernameController});
}
