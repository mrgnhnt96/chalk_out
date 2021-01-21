import 'package:flutter/material.dart';

import 'package:chalk_out/presentation/blocs/ship_it/ship_it_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectContactCard extends StatelessWidget {
  const SelectContactCard({
    Key key,
    @required this.contactName,
  }) : super(key: key);
  final String contactName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(contactName),
              SizedBox(
                width: 18,
              ),
              RaisedButton(
                onPressed: () {
                  context.read<ShipItBloc>()
                    ..add(
                      AddingPlayerPressed(playerName: contactName),
                    );
                },
                child: Text('Invite'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
