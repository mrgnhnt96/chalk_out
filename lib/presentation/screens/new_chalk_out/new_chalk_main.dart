import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import 'package:chalk_out/presentation/screens/participated_chalks/participated_chalks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_chalk_out_screen.dart';

class NewChalkMain extends StatelessWidget {
  static const routeName = '/new_chalk_main';
  static const title = 'new chalk main';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewChalkOutBloc(),
      child: BlocBuilder<NewChalkOutBloc, NewChalkOutState>(
        builder: (context, state) {
          // ignore: close_sinks
          final newChalkOutBloc = BlocProvider.of<NewChalkOutBloc>(context);
          if (state is NewChalkOutCancelled) {
            return ParticipatedChalksScreen();
          } else
            return NewChalkOutScreen(newChalkOutBloc: newChalkOutBloc, title: title);
        },
      ),
    );
  }
}
