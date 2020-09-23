import 'package:chalk_out/presentation/screens/ship_it/components/contact_share_card.dart';
import 'package:flutter/material.dart';

import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import 'package:chalk_out/presentation/blocs/ship_it/ship_it_bloc.dart';

class ShipItScreen extends StatelessWidget {
  const ShipItScreen({
    Key key,
    @required this.newChalkOutBloc,
    @required this.shipItBloc,
    @required this.chalkItWord,
    @required this.title,
    @required this.allowFriendsOfFriends,
  }) : super(key: key);

  final NewChalkOutBloc newChalkOutBloc;
  final ShipItBloc shipItBloc;
  final String chalkItWord;
  final String title;
  final bool allowFriendsOfFriends;

  @override
  Widget build(BuildContext context) {
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
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 56),
            child: Text(title),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                shipItBloc.add(
                  ShipItToFriendsOfFriendsPressed(allowFriendsOfFriends: !allowFriendsOfFriends),
                );
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      !allowFriendsOfFriends ? Icons.check_box_outline_blank : Icons.check_box,
                    ),
                    Text('Allow friends of friends'),
                  ],
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ContactShareCard(
                    contactName: '',
                    index: index + 1,
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                print('Local Game');
              },
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Text('Continue Locally'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
