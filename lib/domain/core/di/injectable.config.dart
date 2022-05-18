// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/allitems/bloc/allitems_bloc.dart' as _i10;
import '../../../application/movies/moviesdatas_bloc.dart' as _i7;
import '../../../application/search/search_bloc.dart' as _i11;
import '../../../infrastructure/allitems/allitems_repo.dart' as _i4;
import '../../../infrastructure/home/home_repo.dart' as _i6;
import '../../../infrastructure/search/search_repo.dart' as _i9;
import '../../allitems/allitems_services.dart' as _i3;
import '../../home/ihome_repo.dart' as _i5;
import '../../search/search_services.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AllitemsServices>(() => _i4.AllitemsRepo());
  gh.lazySingleton<_i5.IHomeRepo>(() => _i6.HomeRepository());
  gh.factory<_i7.MoviesdatasBloc>(
      () => _i7.MoviesdatasBloc(get<_i5.IHomeRepo>()));
  gh.lazySingleton<_i8.SearchServices>(() => _i9.SearchRepo());
  gh.factory<_i10.AllitemsBloc>(
      () => _i10.AllitemsBloc(get<_i3.AllitemsServices>()));
  gh.factory<_i11.SearchBloc>(
      () => _i11.SearchBloc(get<_i5.IHomeRepo>(), get<_i8.SearchServices>()));
  return get;
}
