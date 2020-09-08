import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  String username = 'Taylor Hunt';
  String _initials;

  static TextEditingController _usernameController;

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileScreenStart) {
      _usernameController = TextEditingController(text: username);
      _initials = _usernameController.text.toString().substring(0, 2).toUpperCase();

      yield ProfileScreenLoaded(usernameController: _usernameController, initials: _initials);
    }
    if (event is EditUsernamePressed) {
      yield EditUsernameInProgress();
    } else if (event is EditUsernameCompleted) {
      _usernameController = TextEditingController(text: event.newUsername);
      _initials = _usernameController.text.toString().substring(0, 2).toUpperCase();
      // if (event.newUsername.isNotEmpty) {
      //   print(_usernameController.text);
      // }
      yield EditUsernameSuccess(newUsernameController: _usernameController, initials: _initials);
    }
  }
}
