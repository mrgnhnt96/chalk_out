import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  String username = 'Taylor Hunt';

  static TextEditingController _usernameController = TextEditingController();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileScreenStart) {
      _usernameController.text = username;
      yield ProfileScreenLoaded(usernameController: _usernameController);
    }
    if (event is EditUsernamePressed) {
      yield EditUsernameInProgress();
    } else if (event is EditUsernameCompleted) {
      if (event.newUsername.isNotEmpty) {
        _usernameController.text = event.newUsername;
      }
      yield EditUsernameSuccess(newUsernameController: _usernameController);
    }
  }
}
