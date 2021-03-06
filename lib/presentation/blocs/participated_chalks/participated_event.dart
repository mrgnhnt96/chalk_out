part of 'participated_bloc.dart';

@immutable
abstract class ParticipatedEvent {
  const ParticipatedEvent();
}

class SettingButtonPressed extends ParticipatedEvent {
  List<Object> get props => [];
}

class SettingCloseButtonPressed extends ParticipatedEvent {
  List<Object> get props => [];
}

class NewChalkOutPressed extends ParticipatedEvent {
  List<Object> get props => [];
}
