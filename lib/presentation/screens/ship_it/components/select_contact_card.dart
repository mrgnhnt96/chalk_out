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
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(contactName),
          SizedBox(
            width: 18,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Invite'),
          ),
        ],
      ),
    );
  }
}
