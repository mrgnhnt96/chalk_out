import 'package:chalk_out/presentation/blocs/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chalk_out/presentation/blocs/participated_chalks/participated_bloc.dart';

import 'components/settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  final ParticipatedBloc participatedBloc;
  const SettingsScreen({
    Key key,
    @required this.participatedBloc,
  }) : super(key: key);
  static const routeName = '/settings_screen';
  static const title = 'settings screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc()..add(ProfileScreenStart()),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          // ignore: close_sinks
          final profileBloc = BlocProvider.of<ProfileBloc>(context);
          TextEditingController usernameController;

          if (state is ProfileScreenLoaded) {
            return buildSettingsPage(
              context: context,
              profileBloc: profileBloc,
              state: state,
              usernameController: state.usernameController,
              usernameInitials: state.initials,
              participatedBloc: participatedBloc,
            );
          } else if (state is EditUsernameSuccess) {
            return buildSettingsPage(
              context: context,
              profileBloc: profileBloc,
              state: state,
              usernameController: state.newUsernameController,
              usernameInitials: state.initials,
              participatedBloc: participatedBloc,
            );
          } else {
            return buildSettingsPage(
              context: context,
              profileBloc: profileBloc,
              state: state,
              usernameController: usernameController,
              usernameInitials: '',
              participatedBloc: participatedBloc,
            );
          }
        },
      ),
    );
  }
}
