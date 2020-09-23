import 'package:flutter/material.dart';

class ContactShareCard extends StatelessWidget {
  const ContactShareCard({
    Key key,
    @required this.contactName,
    @required this.index,
  }) : super(key: key);
  final String contactName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 12),
            child: (contactName.isEmpty)
                ? RaisedButton(
                    onPressed: () {},
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
        ],
      ),
    );
  }
}
