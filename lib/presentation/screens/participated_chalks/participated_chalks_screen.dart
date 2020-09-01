import 'package:chalk_out/presentation/blocs/participated_chalks/participated_bloc.dart';
import 'package:chalk_out/presentation/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/chalk_card_lists.dart';

class ParticipatedChalksScreen extends StatefulWidget {
  static const routeName = '/participated_chalk_screen';
  static const title = 'participated chalk screen';

  ParticipatedChalksScreen({Key key}) : super(key: key);

  @override
  _ParticipatedChalksScreenState createState() => _ParticipatedChalksScreenState();
}

class _ParticipatedChalksScreenState extends State<ParticipatedChalksScreen> with SingleTickerProviderStateMixin {
  int itemCount = 5;

  List<Widget> tabList;
  TabController controller;

  @override
  void initState() {
    tabList = [
      buildParticipatedScreen(0),
      buildParticipatedScreen(1),
      buildParticipatedScreen(2),
    ];
    controller = TabController(
      vsync: this,
      length: tabList.length,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParticipatedBloc(),
      child: BlocBuilder<ParticipatedBloc, ParticipatedState>(
        builder: (context, state) {
          // ignore: close_sinks
          final participatedBloc = BlocProvider.of<ParticipatedBloc>(context);
          if (state is SettingsPageInitial) {
            return SettingsScreen(
              participatedBloc: participatedBloc,
            );
          }
          return buildAppBar(
            context: context,
            participatedBloc: participatedBloc,
          );
        },
      ),
    );
  }

  Widget buildAppBar({BuildContext context, ParticipatedBloc participatedBloc}) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          floatingActionButton: SizedBox(
            height: 40,
            child: FloatingActionButton(
              child: Center(
                child: Icon(Icons.add),
              ),
              onPressed: () {},
            ),
          ),
          appBar: AppBar(
            bottom: TabBar(
              labelPadding: EdgeInsets.symmetric(vertical: 8),
              tabs: [
                Text('Your Turn'),
                Text('Live Chalks'),
                Text('Past Chalks'),
              ],
            ),
            title: Center(
              child: Text('Chalk Out'),
            ),
            leading: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.notifications,
                  ),
                ),
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      // borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      //TODO ADD NOTIFICATION COUNT
                      '1',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    participatedBloc.add(
                      SettingButtonPressed(),
                    );
                  },
                ),
              )
            ],
          ),
          body: TabBarView(children: tabList)),
    );
  }

  Widget buildParticipatedScreen(int page) {
    String noChalks;
    IconData icon;
    if (page == 0) {
      noChalks = 'No Chalks waiting on you!';
      icon = Icons.sentiment_very_satisfied;
    } else if (page == 1) {
      noChalks = 'No Live Chalks!';
      icon = Icons.sentiment_dissatisfied;
    } else if (page == 2) {
      noChalks = 'No Past Chalks!';
      icon = Icons.sentiment_dissatisfied;
    }

    return MainChalkSection(
      icon: icon,
      itemCount: itemCount,
      noChalks: noChalks,
    );
  }
}
