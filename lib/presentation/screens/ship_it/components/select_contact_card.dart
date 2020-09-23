import 'package:flutter/material.dart';

class SelectContactCard extends StatelessWidget {
  const SelectContactCard({
    Key key,
    @required this.contactName,
  }) : super(key: key);
  final String contactName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(contactName),
          RaisedButton(
            onPressed: () {},
            child: Text('Invite'),
          ),
        ],
      ),
    );
  }
}
