import 'package:flutter/material.dart';

import 'package:chalk_out/presentation/blocs/settings/settings_bloc.dart';

class SettingsBottomSheet extends StatelessWidget {
  final SettingsBloc settingsBloc;
  final SettingsState state;
  const SettingsBottomSheet({
    Key key,
    @required this.settingsBloc,
    @required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function onPressed;
    return Align(
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
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: (state is ManangeNotificationsInProgress)
                        ? Column(
                            children: <Widget>[
                              buildNotifications(event: SettingsCloseNotificationsPressed(), icon: Icons.arrow_drop_up),
                              Text('Chalk Finished'),
                              Text('Your Turn'),
                            ],
                          )
                        : buildNotifications(event: SettingsDropDownPressed(), icon: Icons.arrow_drop_down),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row buildNotifications({SettingsEvent event, IconData icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Notifications'),
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            settingsBloc.add(event);
          },
        ),
      ],
    );
  }
}
