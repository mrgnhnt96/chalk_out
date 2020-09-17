import 'package:chalk_out/presentation/screens/ship_it/ship_it_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import 'package:chalk_out/presentation/blocs/ship_it/ship_it_bloc.dart';

class ShipItScreenMain extends StatelessWidget {
  static const routeName = '/ship_it_main';
  static const title = 'Ship it!';
  final NewChalkOutBloc newChalkOutBloc;
  final String chalkItWord;

  const ShipItScreenMain({
    Key key,
    @required this.newChalkOutBloc,
    @required this.chalkItWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipItBloc()..add(ShipItStarted()),
      child: BlocBuilder<ShipItBloc, ShipItState>(
        builder: (context, state) {
          // ignore: close_sinks
          final shipItBloc = BlocProvider.of<ShipItBloc>(context);
          if (state is ShipItToFriendsOfFriendsInitial) {
            return ShipItScreen(
              allowFriendsOfFriends: state.allowFriendsOfFriends,
              newChalkOutBloc: newChalkOutBloc,
              shipItBloc: shipItBloc,
              chalkItWord: chalkItWord,
              title: title,
            );
          } else {
            return ShipItScreen(
              newChalkOutBloc: newChalkOutBloc,
              chalkItWord: '',
              allowFriendsOfFriends: false,
              shipItBloc: shipItBloc,
              title: title,
            );
          }
        },
      ),
    );
  }
}
