import 'package:chalk_out/presentation/blocs/settings/settings_bloc.dart';
import 'package:chalk_out/presentation/blocs/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_options.dart';

class SettingsBottomSheet extends StatelessWidget {
  final ProfileBloc profileBloc;
  final ProfileState profileState;
  // final BuildContext context;
  const SettingsBottomSheet({
    Key key,
    @required this.profileBloc,
    @required this.profileState,
    // @required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {},
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            // ignore: close_sinks
            final settingsBloc = BlocProvider.of<SettingsBloc>(context);
            if (state is ManangeNotificationsInProgress) {
              return buildBottomSheet(
                settingsBloc: settingsBloc,
                profileBloc: profileBloc,
                context: context,
                state: state,
                notificationsVisible: true,
                yourTurnBool: state.yourTurnBool,
                chalkFinishedBool: state.chalkFinishedBool,
                removeAdsBool: state.removeAdsBool,
              );
            } else if (state is SettingsInitial) {
              return buildBottomSheet(
                settingsBloc: settingsBloc,
                profileBloc: profileBloc,
                context: context,
                state: state,
                notificationsVisible: false,
                removeAdsBool: state.removeAdsBool,
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildBottomSheet({
    @required SettingsBloc settingsBloc,
    @required ProfileBloc profileBloc,
    @required BuildContext context,
    @required SettingsState state,
    @required bool notificationsVisible,
    bool chalkFinishedBool,
    bool yourTurnBool,
    @required bool removeAdsBool,
  }) {
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
                    child: notificationsVisible
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              buildNotifications(
                                event: SettingsCloseNotificationsPressed(),
                                icon: Icons.arrow_drop_up,
                                settingsBloc: settingsBloc,
                              ),
                              buildOptions(
                                chalkFinishedBool: chalkFinishedBool,
                                yourTurnBool: yourTurnBool,
                                settingsBloc: settingsBloc,
                              ),
                            ],
                          )
                        : buildNotifications(
                            event: SettingsDropDownPressed(),
                            icon: Icons.arrow_drop_down,
                            settingsBloc: settingsBloc,
                          ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: NotificationOption(
                      title: 'Remove Ads',
                      isOn: removeAdsBool,
                      onTap: () {
                        settingsBloc.add(
                          RemoveAdsPressed(
                            removeAdsBool: !removeAdsBool,
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Tapped!');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      child: Text('Help'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildOptions({@required bool chalkFinishedBool, @required bool yourTurnBool, @required SettingsBloc settingsBloc}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NotificationOption(
          isOn: chalkFinishedBool,
          onTap: () {
            settingsBloc.add(
              ChalkFinishedNotificationPressed(
                chalkFinishedBool: !chalkFinishedBool,
              ),
            );
          },
          title: 'Chalk Finished',
        ),
        SizedBox(
          height: 8,
        ),
        NotificationOption(
          isOn: yourTurnBool,
          title: 'Your Turn',
          onTap: () {
            settingsBloc.add(
              YourTurnNotificationPressed(
                yourTurnBool: !yourTurnBool,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildNotifications({@required SettingsEvent event, @required IconData icon, @required SettingsBloc settingsBloc}) {
    return GestureDetector(
      onTap: () {
        settingsBloc.add(event);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Notifications'),
            Icon(
              icon,
            ),
          ],
        ),
      ),
    );
  }
}
