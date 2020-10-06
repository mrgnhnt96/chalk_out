import 'package:flutter/material.dart';

import 'package:chalk_out/presentation/blocs/ship_it/ship_it_bloc.dart';

class ContactShareCard extends StatelessWidget {
  const ContactShareCard({
    Key key,
    @required this.totalRequiredPlayersBool,
    @required this.contactName,
    @required this.index,
    @required this.shipItBloc,
  }) : super(key: key);
  final String contactName;
  final int index;
  final ShipItBloc shipItBloc;
  final bool totalRequiredPlayersBool;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            index.toString(),
            style: TextStyle(fontSize: 30, color: (totalRequiredPlayersBool) ? Colors.black : Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              '/10',
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: contactName.isEmpty ? 0 : 8),
                  child: (contactName.isEmpty)
                      ? RaisedButton(
                          onPressed: () {
                            shipItBloc.add(
                              AddPlayerStarted(),
                            );
                          },
                          child: Text('Add Player'),
                        )
                      : Container(
                          child: Text(contactName),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                ),
                (contactName.isEmpty)
                    ? Container()
                    : IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          shipItBloc.add(RemovePlayerPressed(index: index));
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
