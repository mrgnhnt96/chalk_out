import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ship_it_event.dart';
part 'ship_it_state.dart';

class ShipItBloc extends Bloc<ShipItEvent, ShipItState> {
  ShipItBloc() : super(ShipItInitial());

  @override
  Stream<ShipItState> mapEventToState(
    ShipItEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
