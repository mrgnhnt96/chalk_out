import 'package:chalk_out/presentation/screens/ship_it/ship_it_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import 'package:chalk_out/presentation/blocs/ship_it/ship_it_bloc.dart';

import 'components/contact_bottom_sheet.dart';

class ShipItScreenMain extends StatefulWidget {
  const ShipItScreenMain({
    Key key,
    @required this.newChalkOutBloc,
    @required this.chalkItWord,
  }) : super(key: key);

  static const routeName = '/ship_it_main';
  static const title = 'Ship it!';

  final String chalkItWord;
  final NewChalkOutBloc newChalkOutBloc;

  @override
  _ShipItScreenMainState createState() => _ShipItScreenMainState();
}

class _ShipItScreenMainState extends State<ShipItScreenMain> {
  // ignore: close_sinks
  ShipItBloc shipItBloc;

  @override
  void initState() {
    shipItBloc = ShipItBloc()..add(ShipItStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => shipItBloc,
      child: BlocBuilder<ShipItBloc, ShipItState>(
        builder: (context, state) {
          if (state is ShipItToFriendsOfFriendsInitial) {
            return ShipItScreen(
              totalRequiredPlayersBool: state.totalRequiredPlayersBool,
              playerList: state.playerList,
              allowFriendsOfFriends: state.allowFriendsOfFriends,
              chalkItWord: widget.chalkItWord,
              title: ShipItScreenMain.title,
            );
          } else if (state is AddPlayerInitial) {
            return ContactBottomSheet(
              contactList: state.contactList,
            );
          } else if (state is AddPlayerComplete) {
            return ShipItScreen(
              totalRequiredPlayersBool: state.totalRequiredPlayersBool,
              chalkItWord: '',
              allowFriendsOfFriends: state.allowFriendsOfFriends,
              title: ShipItScreenMain.title,
              playerList: state.playerList,
            );
          } else if (state is PlayerRemovedComplete) {
            return ShipItScreen(
              totalRequiredPlayersBool: state.totalRequiredPlayersBool,
              allowFriendsOfFriends: state.allowFriendsOfFriends,
              playerList: state.newPlayerList,
              title: ShipItScreenMain.title,
              chalkItWord: widget.chalkItWord,
            );
          } else {
            return ShipItScreen(
              totalRequiredPlayersBool: false,
              playerList: [],
              chalkItWord: '',
              allowFriendsOfFriends: false,
              title: ShipItScreenMain.title,
            );
          }
        },
      ),
    );
  }
}
