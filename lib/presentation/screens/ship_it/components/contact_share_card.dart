import 'package:flutter/material.dart';

import 'package:chalk_out/presentation/blocs/ship_it/ship_it_bloc.dart';

class ContactShareCard extends StatelessWidget {
  const ContactShareCard({
    Key key,
    @required this.contactName,
    @required this.index,
    @required this.shipItBloc,
  }) : super(key: key);
  final String contactName;
  final int index;
  final ShipItBloc shipItBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * .45,
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index.toString(),
            style: TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text('/10'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: contactName.isEmpty ? 0 : 12),
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
              // IconButton(
              //   icon: Icon(Icons.delete),
              //   onPressed: () {},
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
