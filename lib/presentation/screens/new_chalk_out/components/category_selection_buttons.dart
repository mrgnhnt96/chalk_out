import 'package:flutter/material.dart';

import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import 'package:chalk_out/presentation/screens/new_chalk_out/components/category_button.dart';

class CategorySelection extends StatelessWidget {
  final NewChalkOutBloc newChalkOutBloc;
  const CategorySelection({
    Key key,
    @required this.newChalkOutBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CategoryButton(
          title: 'Games',
          onPressed: () {
            onPressed();
          },
        ),
        CategoryButton(
          title: 'Sports',
          onPressed: () {
            onPressed();
          },
        ),
        CategoryButton(
          onPressed: () {
            onPressed();
          },
          title: 'Entertainment',
        ),
        CategoryButton(
          onPressed: () {
            onPressed();
          },
          title: 'Books',
        ),
        CategoryButton(
          onPressed: () {
            onPressed();
          },
          title: 'Art',
        ),
        CategoryButton(
          onPressed: () {
            onPressed();
          },
          title: 'Theater',
        ),
        CategoryButton(
          onPressed: () {
            onPressed();
          },
          title: 'Movies',
        ),
        CategoryButton(
          onPressed: () {
            onPressed();
          },
          title: 'Technology',
        ),
      ],
    );
  }

  onPressed() {
    newChalkOutBloc.add(NewRandomWordPressed());
  }
}
