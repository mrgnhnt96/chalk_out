import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ship_it_event.dart';
part 'ship_it_state.dart';

class ShipItBloc extends Bloc<ShipItEvent, ShipItState> {
  ShipItBloc() : super(ShipItInitial());

  List<String> dummyContactList = [
    'Joey',
    'Dave',
    'Steve',
    'Morgan (4%)',
    'Josh',
    'Drake',
    'Liam',
    'Emma',
    'Olivia',
    'Ava',
    'Isabella',
    'Sophia',
    'Charlotte',
    'Mia',
    'Amelia',
    'Harper',
    'Evelyn',
    'Abigail',
    'Emily',
    'Elizabeth',
    'Mila',
    'Ella',
    'Avery',
    'Sofia',
    'Camila',
    'Aria',
    'Scarlett',
    'Victoria',
    'Madison',
    'Luna',
    'Grace',
    'Chloe',
    'Penelope',
    'Layla',
    'Riley',
    'Zoey',
    'Nora',
    'Lily',
    'Eleanor',
    'Hannah',
    'Lillian',
    'Addison',
    'Aubrey',
    'Ellie',
    'Stella',
    'Natalie',
    'Zoe',
    'Leah',
    'Hazel',
    'Violet',
    'Aurora',
    'Savannah',
    'Audrey',
    'Brooklyn',
    'Bella',
    'Claire',
    'Skylar',
    'Lucy',
    'Paisley',
    'Everly',
    'Anna',
    'Caroline',
    'Nova',
    'Genesis',
    'Emilia',
    'Kennedy',
    'Samantha',
    'Maya',
    'Willow',
    'Kinsley',
    'Naomi',
    'Aaliyah',
    'Elena',
    'Sarah',
    'Ariana',
    'Allison',
    'Gabriella',
    'Alice',
    'Madelyn',
    'Cora',
    'Ruby',
    'Eva',
    'Serenity',
    'Autumn',
    'Adeline',
    'Hailey',
    'Gianna',
    'Valentina',
    'Isla',
    'Eliana',
    'Quinn',
    'Nevaeh',
    'Ivy',
    'Sadie',
    'Piper',
    'Lydia',
    'Alexa',
    'Josephine',
    'Emery',
    'Julia',
    'Delilah',
    'Arianna',
    'Vivian',
    'Kaylee',
    'Sophie',
    'Brielle',
    'Madeline',
    'Noah',
    'William',
    'James',
    'Oliver',
    'Benjamin',
    'Elijah',
    'Lucas',
    'Mason',
    'Logan',
    'Alexander',
    'Ethan',
    'Jacob',
    'Michael',
    'Daniel',
    'Henry',
    'Jackson',
    'Sebastian',
    'Aiden',
    'Matthew',
    'Samuel',
    'David',
    'Joseph',
    'Carter',
    'Owen',
    'Wyatt',
    'John',
    'Jack',
    'Luke',
    'Jayden',
    'Dylan',
    'Grayson',
    'Levi',
    'Isaac',
    'Gabriel',
    'Julian',
    'Mateo',
    'Anthony',
    'Jaxon',
    'Lincoln',
    'Joshua',
    'Christopher',
    'Andrew',
    'Theodore',
    'Caleb',
    'Ryan',
    'Asher',
    'Nathan',
    'Thomas',
    'Leo',
    'Isaiah',
    'Charles',
    'Josiah',
    'Hudson',
    'Christian',
    'Hunter',
    'Connor',
    'Eli',
    'Ezra',
    'Aaron',
    'Landon',
    'Adrian',
    'Jonathan',
    'Nolan',
    'Jeremiah',
    'Easton',
    'Elias',
    'Colton',
    'Cameron',
    'Carson',
    'Robert',
    'Angel',
    'Maverick',
    'Nicholas',
    'Dominic',
    'Jaxson',
    'Greyson',
    'Adam',
    'Ian',
    'Austin',
    'Santiago',
    'Jordan',
    'Cooper',
    'Brayden',
    'Roman',
    'Evan',
    'Ezekiel',
    'Xavier',
    'Jose',
    'Jace',
    'Jameson',
    'Leonardo',
    'Bryson',
    'Axel',
    'Everett',
    'Parker',
    'Kayden',
    'Miles',
    'Sawyer',
    'Jason',
    '# im dah best'
  ];

  List<String> playerList = [];

  static bool allowFriendsOfFriends = false;

  @override
  Stream<ShipItState> mapEventToState(
    ShipItEvent event,
  ) async* {
    if (event is ShipItStarted) {
      yield ShipItToFriendsOfFriendsInitial(
        playerList: playerList,
        allowFriendsOfFriends: allowFriendsOfFriends,
      );
    } else if (event is ShipItToFriendsOfFriendsPressed) {
      allowFriendsOfFriends = event.allowFriendsOfFriends;
      yield ShipItToFriendsOfFriendsInitial(
        playerList: playerList,
        allowFriendsOfFriends: event.allowFriendsOfFriends,
      );
    } else if (event is AddPlayerStarted) {
      yield AddPlayerInitial(contactList: dummyContactList);
    } else if (event is AddingPlayerPressed) {
      playerList.add(event.playerName);

      yield AddPlayerComplete(
        playerList: playerList,
        allowFriendsOfFriends: allowFriendsOfFriends,
      );
    } else if (event is RemovePlayerPressed) {
      playerList.removeAt(event.index - 1);
      yield PlayerRemovedComplete(
        newPlayerList: playerList,
        allowFriendsOfFriends: allowFriendsOfFriends,
      );
    }
  }
}
