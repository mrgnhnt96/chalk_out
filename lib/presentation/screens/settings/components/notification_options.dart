import 'package:flutter/material.dart';

class NotificationOption extends StatelessWidget {
  const NotificationOption({
    @required this.title,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title),
          Icon(
            Icons.check_box_outline_blank,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
