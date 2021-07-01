import 'package:flutter/material.dart';

Widget notificationIcon() {
  return Positioned(
    right: 11,
    top: 11,
    child: Container(
      constraints: BoxConstraints(
        minWidth: 14,
        minHeight: 14,
      ),
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
        // borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        //TODO ADD NOTIFICATION COUNT
        '1',
        textAlign: TextAlign.center,
      ),
    ),
  );
}
