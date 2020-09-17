import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ship_it_event.dart';
part 'ship_it_state.dart';

class ShipItBloc extends Bloc<ShipItEvent, ShipItState> {
  ShipItBloc() : super(ShipItInitial());

  static bool allowFriendsOfFriends = false;

  @override
  Stream<ShipItState> mapEventToState(
    ShipItEvent event,
  ) async* {
    if (event is ShipItStarted) {
      yield ShipItToFriendsOfFriendsInitial(allowFriendsOfFriends: allowFriendsOfFriends);
    } else if (event is ShipItToFriendsOfFriendsPressed) {
      yield ShipItToFriendsOfFriendsInitial(allowFriendsOfFriends: event.allowFriendsOfFriends);
    }
  }
}
