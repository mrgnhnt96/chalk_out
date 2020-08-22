import 'package:flutter/material.dart';

import 'package:chalk_out/presentation/widgets/core/chalk_cards.dart';

class MainChalkSection extends StatelessWidget {
  const MainChalkSection({
    Key key,
    @required this.itemCount,
    @required this.noChalks,
    @required this.icon,
  }) : super(key: key);

  final int itemCount;
  final String noChalks;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          itemCount != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  //TODO CHANGE ITEM COUNT
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return ChalkCards();
                  },
                )
              : Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Text(noChalks),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(icon),
                    ],
                  ),
                ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
