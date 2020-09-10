import 'package:flutter/material.dart';

import 'chalk_card_lists.dart';

class MainPageManager extends StatelessWidget {
  const MainPageManager({
    Key key,
    @required this.itemCount,
    @required this.page,
  }) : super(key: key);

  final int itemCount;
  final int page;

  @override
  Widget build(BuildContext context) {
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
