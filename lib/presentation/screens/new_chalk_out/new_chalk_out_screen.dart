import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/category_selection_buttons.dart';

class NewChalkOutScreen extends StatelessWidget {
  const NewChalkOutScreen({
    Key key,
    @required this.title,
    @required this.randomWord,
  }) : super(key: key);

  final String title;
  final String randomWord;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    NewChalkOutBloc newChalkOutBloc = context.bloc<NewChalkOutBloc>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              context.bloc<NewChalkOutBloc>().add(NewChalkOutClosePressed());
            },
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 75,
              child: Center(child: Text(randomWord)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('Random'),
                onPressed: () {
                  context.bloc<NewChalkOutBloc>().add(NewRandomWordPressed());
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Choose a Category'),
              ),
            ),
            CategorySelection(newChalkOutBloc: newChalkOutBloc),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (randomWord != '') {
                      context.bloc<NewChalkOutBloc>().add(ChalkItPressed(chalkItWord: randomWord));
                    }
                  },
                  child: Text('Chalk it!'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
