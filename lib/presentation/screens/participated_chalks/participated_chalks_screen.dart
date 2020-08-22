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
      child: BlocListener<ParticipatedBloc, ParticipatedState>(
        listener: (context, state) {},
        child: BlocBuilder<ParticipatedBloc, ParticipatedState>(
          builder: (context, state) {
            if (state is SettingsInitial) {
              return SettingsScreen();
            }
            return buildAppBar(context: context);
          },
        ),
      ),
    );
  }

  Widget buildAppBar({BuildContext context}) {
    // ignore: close_sinks
    final participatedBloc = BlocProvider.of<ParticipatedBloc>(context);
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
            leading: Icon(
              Icons.notifications,
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
