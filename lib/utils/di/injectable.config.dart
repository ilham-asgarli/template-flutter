// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i4;

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../core/cache/isar_manager.dart' as _i6;
import '../../data/data-sources/remote/security/security_remote_data_source.dart'
    as _i10;
import '../../data/repositories/security/security_repository_impl.dart' as _i12;
import '../../domain/repositories/security/security_repository.dart' as _i11;
import '../../presentation/features/my-app/view-models/my_app_view_model.dart'
    as _i9;
import '../config/theme/exapmle_theme.dart' as _i5;
import '../config/theme/main_theme.dart' as _i8;
import '../helpers/theme/theme_helper.dart' as _i14;
import 'register_module.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Dio>(registerModule.dio);
    await gh.lazySingletonAsync<_i4.Directory>(
      () => registerModule.applicationDocumentsDirectory,
      instanceName: 'applicationDocumentsDirectory',
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.Directory>(
      () => registerModule.temporaryDirectory,
      instanceName: 'temporaryDirectory',
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.Directory>(
      () => registerModule.applicationCacheDirectory,
      instanceName: 'applicationCacheDirectory',
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.Directory>(
      () => registerModule.applicationSupportDirectory,
      instanceName: 'applicationSupportDirectory',
      preResolve: true,
    );
    gh.lazySingleton<_i5.ExampleTheme>(() => _i5.ExampleTheme());
    gh.lazySingleton<_i6.IsarManager>(() => _i6.IsarManager());
    gh.singleton<_i7.Logger>(registerModule.logger);
    gh.lazySingleton<_i8.MainTheme>(() => _i8.MainTheme());
    gh.lazySingleton<_i9.MyAppViewModel>(() => _i9.MyAppViewModel());
    gh.factory<_i10.SecurityRemoteDataSource>(
        () => _i10.SecurityRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i11.SecurityRepository>(() => _i12.SecurityRepositoryImpl(
        securityRemoteDataSource: gh<_i10.SecurityRemoteDataSource>()));
    await gh.lazySingletonAsync<_i13.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i14.ThemeHelper>(_i14.ThemeHelper());
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
