import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'first_sketch_event.dart';
part 'first_sketch_state.dart';

class FirstSketchBloc extends Bloc<FirstSketchEvent, FirstSketchState> {
  FirstSketchBloc() : super(FirstSketchInitial());

  @override
  Stream<FirstSketchState> mapEventToState(
    FirstSketchEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
