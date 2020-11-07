// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import 'package:chalk_out/presentation/blocs/participated_chalks/participated_bloc.dart';
import 'package:chalk_out/presentation/blocs/profile/profile_bloc.dart';
import 'package:chalk_out/presentation/blocs/settings/settings_bloc.dart';
import 'package:chalk_out/presentation/blocs/ship_it/ship_it_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<NewChalkOutBloc>(() => NewChalkOutBloc());
  g.registerFactory<ParticipatedBloc>(() => ParticipatedBloc());
  g.registerFactory<ProfileBloc>(() => ProfileBloc());
  g.registerFactory<SettingsBloc>(() => SettingsBloc());
  g.registerFactory<ShipItBloc>(() => ShipItBloc());
}
