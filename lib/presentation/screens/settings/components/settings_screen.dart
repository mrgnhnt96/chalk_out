import 'package:chalk_out/presentation/blocs/participated_chalks/participated_bloc.dart';
import 'package:chalk_out/presentation/blocs/profile/profile_bloc.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet.dart';
import 'chalk_count.dart';

Widget buildSettingsPage({
  @required BuildContext context,
  @required ProfileBloc profileBloc,
  @required ProfileState state,
  @required String usernameInitials,
  @required TextEditingController usernameController,
  @required ParticipatedBloc participatedBloc,
}) {
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
                  width: 76,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      usernameInitials,
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
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      return profileBloc.add(EditUsernameCompleted(newUsername: value));
                    },
                    validator: (value) {
                      if (value.length < 4) {
                        return 'Please enter a Username with 4 or more characters';
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
                      ChalkCount(
                        title: clalks,
                        counter: 125,
                      ),
                      ChalkCount(
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
