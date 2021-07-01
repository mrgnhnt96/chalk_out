import 'package:chalk_out/presentation/blocs/participated_chalks/participated_bloc.dart';
import 'package:chalk_out/presentation/screens/participated_chalks/components/notification_icon.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({
    Key key,
    @required this.tabList,
    // @required this.context,
    @required this.participatedBloc,
  }) : super(key: key);

  final List<Widget> tabList;
  // final BuildContext context;
  final ParticipatedBloc participatedBloc;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          floatingActionButton: SizedBox(
            height: 40,
            child: FloatingActionButton(
              child: Center(
                child: Icon(Icons.add),
              ),
              onPressed: () {
                participatedBloc.add(NewChalkOutPressed());
              },
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
                notificationIcon(),
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

  @override
  Size get preferredSize => Size.fromHeight(100);
}
