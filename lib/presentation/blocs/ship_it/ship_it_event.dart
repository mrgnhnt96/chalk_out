part of 'ship_it_bloc.dart';

@immutable
abstract class ShipItEvent {}

class ShipItToFriendsOfFriendsPressed extends ShipItEvent {
  final bool allowFriendsOfFriends;

  ShipItToFriendsOfFriendsPressed({@required this.allowFriendsOfFriends});
}

class ShipItStarted extends ShipItEvent {}
