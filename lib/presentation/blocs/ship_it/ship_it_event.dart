part of 'ship_it_bloc.dart';

@immutable
abstract class ShipItEvent {}

class ShipItToFriendsOfFriendsPressed extends ShipItEvent {
  final bool allowFriendsOfFriends;

  ShipItToFriendsOfFriendsPressed({@required this.allowFriendsOfFriends});
}

class ShipItStarted extends ShipItEvent {}

class AddPlayerStarted extends ShipItEvent {}

class AddingPlayerPressed extends ShipItEvent {
  final String playerName;

  AddingPlayerPressed({@required this.playerName});
}

class RemovePlayerPressed extends ShipItEvent {
  final int index;

  RemovePlayerPressed({@required this.index});
}
