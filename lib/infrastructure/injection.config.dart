// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import '../presentation/blocs/participated_chalks/participated_bloc.dart';
import '../presentation/blocs/profile/profile_bloc.dart';
import '../presentation/blocs/settings/settings_bloc.dart';
import '../presentation/blocs/ship_it/ship_it_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<NewChalkOutBloc>(() => NewChalkOutBloc());
  gh.factory<ParticipatedBloc>(() => ParticipatedBloc());
  gh.factory<ProfileBloc>(() => ProfileBloc());
  gh.factory<SettingsBloc>(() => SettingsBloc());
  gh.factory<ShipItBloc>(() => ShipItBloc());
  return get;
}
