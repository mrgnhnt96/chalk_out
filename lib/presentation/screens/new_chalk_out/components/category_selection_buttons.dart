import 'package:chalk_out/presentation/screens/new_chalk_out/components/category_button.dart';
import 'package:flutter/material.dart';

class CategorySelection extends StatelessWidget {
  const CategorySelection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CategoryButton(
          title: 'Games',
        ),
        CategoryButton(
          title: 'Sports',
        ),
        CategoryButton(
          title: 'Entertainment',
        ),
        CategoryButton(
          title: 'Books',
        ),
        CategoryButton(
          title: 'Art',
        ),
        CategoryButton(
          title: 'Theater',
        ),
        CategoryButton(
          title: 'Movies',
        ),
        CategoryButton(
          title: 'Technology',
        ),
      ],
    );
  }
}
