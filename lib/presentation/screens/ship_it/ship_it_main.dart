import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import 'package:chalk_out/presentation/blocs/ship_it/ship_it_bloc.dart';

class ShipItScreenMain extends StatelessWidget {
  static const routeName = '/ship_it_main';
  static const title = 'ship it main';
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
      create: (context) => ShipItBloc(),
      child: BlocBuilder<ShipItBloc, ShipItState>(
        builder: (context, state) {
          // ignore: close_sinks
          final newChalkOutBloc = BlocProvider.of<NewChalkOutBloc>(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    newChalkOutBloc.add(
                      CloseShipItPressed(chalkItWord: chalkItWord),
                    );
                  },
                ),
              ],
              title: Text(title),
            ),
            body: Center(
              child: Text(
                'this is the ship it main.',
              ),
            ),
          );
        },
      ),
    );
  }
}
