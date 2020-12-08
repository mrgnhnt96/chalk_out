import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'draw_chalk_event.dart';
part 'draw_chalk_state.dart';

class DrawChalkBloc extends Bloc<DrawChalkEvent, DrawChalkState> {
  DrawChalkBloc() : super(DrawChalkInitial());

  @override
  Stream<DrawChalkState> mapEventToState(
    DrawChalkEvent event,
  ) async* {}
}
