import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_chalk_out_event.dart';
part 'new_chalk_out_state.dart';

class NewChalkOutBloc extends Bloc<NewChalkOutEvent, NewChalkOutState> {
  NewChalkOutBloc() : super(NewChalkOutInitial());

  @override
  Stream<NewChalkOutState> mapEventToState(
    NewChalkOutEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
