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
