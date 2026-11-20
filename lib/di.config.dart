// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:practica_1/data/database.dart' as _i1040;
import 'package:practica_1/data/dbms_repository.dart' as _i9;
import 'package:practica_1/pages/bloc/dbms_bloc.dart' as _i687;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1040.AppDatabase>(() => _i1040.AppDatabase());
    gh.lazySingleton<_i9.DbmsRepository>(
      () => _i9.DbmsRepository(gh<_i1040.AppDatabase>()),
    );
    gh.factory<_i687.DbmsBloc>(() => _i687.DbmsBloc(gh<_i9.DbmsRepository>()));
    return this;
  }
}
