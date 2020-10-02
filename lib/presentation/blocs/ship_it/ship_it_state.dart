part of 'ship_it_bloc.dart';

@immutable
abstract class ShipItState {}

class ShipItInitial extends ShipItState {}

class ShareChalkInitial extends ShipItState {
  final bool allowFriendsOfFriends;

  ShareChalkInitial({@required this.allowFriendsOfFriends});
}

class ShipItToFriendsOfFriendsInitial extends ShipItState {
  final bool allowFriendsOfFriends;

  ShipItToFriendsOfFriendsInitial({@required this.allowFriendsOfFriends});
}

class AddPlayerInitial extends ShipItState {
  final List<String> contactList;

  AddPlayerInitial({@required this.contactList});
}

class AddPlayerComplete extends ShipItState {
  final List<String> playerList;

  AddPlayerComplete({@required this.playerList});
}

class PlayerRemovedComplete extends ShipItState {
  final List<String> newPlayerList;

  PlayerRemovedComplete({@required this.newPlayerList});
}
