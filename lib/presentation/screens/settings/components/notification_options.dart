import 'package:flutter/material.dart';

class NotificationOption extends StatelessWidget {
  const NotificationOption({
    @required this.title,
    @required this.isOn,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final bool isOn;

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
            isOn ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
