import 'package:chalk_out/presentation/blocs/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chalk_out/presentation/blocs/participated_chalks/participated_bloc.dart';

import 'components/bottom_sheet.dart';
import 'components/chalk_count.dart';

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
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            // ignore: close_sinks
            final profileBloc = BlocProvider.of<ProfileBloc>(context);
            return buildPage(context: context, profileBloc: profileBloc, state: state);
          },
        ),
      ),
    );
  }

  Scaffold buildPage({
    BuildContext context,
    ProfileBloc profileBloc,
    ProfileState state,
    String initials,
  }) {
    TextEditingController username;
    if (state is ProfileInitial) {
      initials = state.usernameController.text.toString().substring(0, 2).toUpperCase();
      username = state.usernameController;
    } else if (state is EditUsernameSuccess) {
      final editName = state.newUsernameController;

      username = editName;

      initials = editName.text.toString().substring(0, 2).toUpperCase();
    } else {
      initials = '##';
    }

    String clalks = 'chalks';
    String wins = 'wins';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          participatedBloc.add(
                            SettingCloseButtonPressed(),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    // height: 70,
                    // wi: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        initials,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      onTap: () {
                        profileBloc.add(
                          EditUsernamePressed(),
                        );
                      },
                      controller: username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        return profileBloc.add(
                          EditUsernameCompleted(
                            newUsername: value,
                          ),
                        );
                      },
                      validator: (value) {
                        if (value.length < 3) {
                          return 'Please enter a Username with 3 or more characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ChalkCounter(
                          title: clalks,
                          counter: 125,
                        ),
                        ChalkCounter(
                          title: wins,
                          counter: 125,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SettingsBottomSheet(
            profileState: state,
            profileBloc: profileBloc,
          ),
        ],
      ),
    );
  }
}
