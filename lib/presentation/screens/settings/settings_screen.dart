import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chalk_out/presentation/blocs/participated_chalks/participated_bloc.dart';
import 'package:chalk_out/presentation/blocs/settings/settings_bloc.dart';

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
      create: (context) => SettingsBloc(),
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {},
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            // ignore: close_sinks
            final settingsBloc = BlocProvider.of<SettingsBloc>(context);
            return buildPage(context: context, settingsBloc: settingsBloc, state: state);
          },
        ),
      ),
    );
  }

  Scaffold buildPage({
    BuildContext context,
    SettingsBloc settingsBloc,
    SettingsState state,
  }) {
    TextEditingController username;
    if (state is SettingsInitial) {
      username = state.usernameController;
    } else if (state is EditUsernameSuccess) {
      username = state.newUsernameController;
    }

    String clalks = 'chalks';
    String wins = 'wins';
    return Scaffold(
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'TH',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .50,
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                    child: TextField(
                      onTap: () {
                        settingsBloc.add(
                          EditUsernamePressed(),
                        );
                      },
                      controller: username,
                      // enabled: (state is EditUsernameInProgress) ? true : false,
                      // readOnly: (state is EditUsernameInProgress) ? true : false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.1,
              maxChildSize: 0.5,
              minChildSize: 0.1,
              builder: (context, ScrollController controller) {
                return SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  controller: controller,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    height: MediaQuery.of(context).size.height * .5,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Settings',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
