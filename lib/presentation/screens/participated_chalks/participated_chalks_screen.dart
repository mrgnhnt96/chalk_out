import 'package:chalk_out/presentation/blocs/participated_chalks/participated_bloc.dart';
import 'package:chalk_out/presentation/screens/new_chalk_out/new_chalk_main.dart';
import 'package:chalk_out/presentation/screens/settings/main_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/app_bar.dart';
import 'components/main_page_manager.dart';

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
      MainPageManager(itemCount: itemCount, page: 0),
      MainPageManager(itemCount: itemCount, page: 1),
      MainPageManager(itemCount: itemCount, page: 2),
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
          } else if (state is NewChalkOutStart) {
            return NewChalkScreenMain();
          }
          return MainAppBar(tabList: tabList, participatedBloc: participatedBloc);
        },
      ),
    );
  }
}
