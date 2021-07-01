import 'package:chalk_out/presentation/blocs/first_sketch/first_sketch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainStartScreen extends StatefulWidget {
  final String chalkItWord;
  const MainStartScreen({
    Key key,
    @required this.chalkItWord,
  });

  static const routeName = '/main_start_screen';
  static const title = 'main start screen';

  @override
  _MainStartScreenState createState() => _MainStartScreenState();
}

class _MainStartScreenState extends State<MainStartScreen> {
  // ignore: close_sinks
  FirstSketchBloc firstSketchBloc;

  @override
  void initState() {
    firstSketchBloc = FirstSketchBloc()..add(FirstSketchStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => firstSketchBloc,
      child: BlocBuilder<FirstSketchBloc, FirstSketchState>(
        builder: (context, state) {
          return null;
        },
      ),
    );
  }
}
