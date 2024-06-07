// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:dokan/core/app/app_dependency.dart' as _i11;
import 'package:dokan/core/app/app_preference.dart' as _i3;
import 'package:dokan/data/network/api_client.dart' as _i8;
import 'package:dokan/features/screens/auth/cubit/auth_cubit.dart' as _i10;
import 'package:dokan/features/screens/auth/repository/auth_repository_impl.dart'
    as _i9;
import 'package:dokan/features/screens/no_internet/cubit/internet_cubit.dart'
    as _i5;
import 'package:dokan/features/screens/theme/cubit/theme_cubit.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.AppPreferences>(() => _i3.AppPreferences());
  gh.factory<_i4.Dio>(() => appModule.dio);
  gh.factory<_i5.InternetCubit>(() => _i5.InternetCubit());
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i7.ThemeCubit>(() => _i7.ThemeCubit());
  gh.factory<_i8.ApiClient>(() => _i8.ApiClient(gh<_i4.Dio>()));
  gh.factory<_i9.AuthRepositoryImpl>(
      () => _i9.AuthRepositoryImpl(gh<_i8.ApiClient>()));
  gh.factory<_i10.AuthCubit>(
      () => _i10.AuthCubit(gh<_i9.AuthRepositoryImpl>()));
  return getIt;
}

class _$AppModule extends _i11.AppModule {}
