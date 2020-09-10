import 'package:flutter/material.dart';

class ChalkCount extends StatelessWidget {
  final String title;
  final int counter;
  const ChalkCount({
    @required this.title,
    @required this.counter,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .33,
      child: Column(
        children: <Widget>[
          Text(title.toUpperCase()),
          Divider(
            thickness: 2,
            color: Colors.black,
            indent: MediaQuery.of(context).size.width * .07,
            endIndent: MediaQuery.of(context).size.width * .07,
          ),
          Text(counter.toString()),
        ],
      ),
    );
  }
}
