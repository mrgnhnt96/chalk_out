import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  const CategoryButton({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 30,
        maxWidth: 150,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      child: RaisedButton(
        child: Text(title),
        onPressed: () {},
      ),
    );
  }
}
