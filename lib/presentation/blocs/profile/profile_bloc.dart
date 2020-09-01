import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(
          ProfileInitial(usernameController: _usernameController),
        );

  String username = 'Taylor Hunt';

  ProfileState get initialState {
    _usernameController.text = username;
    return ProfileInitial(usernameController: _usernameController);
  }

  static TextEditingController _usernameController = TextEditingController();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
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
