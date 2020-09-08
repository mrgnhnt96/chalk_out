part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {
  ProfileInitial();
}

class ProfileScreenLoaded extends ProfileState {
  final TextEditingController usernameController;
  final String initials;

  ProfileScreenLoaded({@required this.usernameController, @required this.initials});
}

class EditUsernameInProgress extends ProfileState {}

class EditUsernameSuccess extends ProfileState {
  final TextEditingController newUsernameController;
  final String initials;

  EditUsernameSuccess({
    @required this.newUsernameController,
    @required this.initials,
  });
}
