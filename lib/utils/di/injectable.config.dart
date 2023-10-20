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
import 'package:isar/isar.dart' as _i6;
import 'package:logger/logger.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../../data/datasources/security/local/security.local.datasource.dart'
    as _i11;
import '../../data/datasources/security/remote/security_remote_data_source.dart'
    as _i14;
import '../../data/repositories/security/local/security.local.repository.impl.dart'
    as _i13;
import '../../data/repositories/security/remote/security.remote.repository.impl.dart'
    as _i16;
import '../../domain/repositories/security/local/security.local.repository.dart'
    as _i12;
import '../../domain/repositories/security/remote/security.remote.repository.dart'
    as _i15;
import '../../domain/usecases/security/get_user_use_case.dart' as _i19;
import '../../presentation/features/my-app/view-models/my_app_view_model.dart'
    as _i10;
import '../../presentation/utils/config/theme/exapmle_theme.dart' as _i5;
import '../../presentation/utils/config/theme/main_theme.dart' as _i9;
import '../../presentation/utils/helpers/theme/theme_helper.dart' as _i18;
import '../../presentation/utils/managers/isar_manager.dart' as _i7;
import 'isar_register_module.dart' as _i21;
import 'register_module.dart' as _i20;

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
    final isarRegisterModule = _$IsarRegisterModule();
    gh.singleton<_i3.Dio>(registerModule.dio);
    await gh.lazySingletonAsync<_i4.Directory>(
      () => registerModule.applicationDocumentsDirectory,
      instanceName: 'applicationDocumentsDirectory',
      preResolve: true,
    );
    gh.lazySingletonAsync<_i4.Directory>(
      () => registerModule.temporaryDirectory,
      instanceName: 'temporaryDirectory',
    );
    gh.lazySingletonAsync<_i4.Directory>(
      () => registerModule.applicationCacheDirectory,
      instanceName: 'applicationCacheDirectory',
    );
    gh.lazySingletonAsync<_i4.Directory>(
      () => registerModule.applicationSupportDirectory,
      instanceName: 'applicationSupportDirectory',
    );
    gh.lazySingleton<_i5.ExampleTheme>(() => _i5.ExampleTheme());
    gh.lazySingleton<_i6.Isar>(
      () => isarRegisterModule.users,
      instanceName: 'users',
    );
    gh.lazySingleton<_i7.IsarManager>(() => _i7.IsarManager(
        applicationDocumentsDirectory:
            gh<_i4.Directory>(instanceName: 'applicationDocumentsDirectory')));
    gh.singleton<_i8.Logger>(registerModule.logger);
    gh.lazySingleton<_i9.MainTheme>(() => _i9.MainTheme());
    gh.lazySingleton<_i10.MyAppViewModel>(() => _i10.MyAppViewModel());
    gh.lazySingleton<_i11.SecurityLocalDataSource>(() =>
        _i11.SecurityLocalDataSource(
            isar: gh<_i6.Isar>(instanceName: 'users')));
    gh.lazySingleton<_i12.SecurityLocalRepository>(() =>
        _i13.SecurityLocalRepositoryImpl(
            securityLocalDataSource: gh<_i11.SecurityLocalDataSource>()));
    gh.lazySingleton<_i14.SecurityRemoteDataSource>(
        () => _i14.SecurityRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i15.SecurityRemoteRepository>(() =>
        _i16.SecurityRemoteRepositoryImpl(
            securityRemoteDataSource: gh<_i14.SecurityRemoteDataSource>()));
    await gh.lazySingletonAsync<_i17.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i18.ThemeHelper>(_i18.ThemeHelper());
    gh.lazySingleton<_i19.GetUserUseCase>(() => _i19.GetUserUseCase(
          securityRemoteRepository: gh<_i15.SecurityRemoteRepository>(),
          securityLocalRepository: gh<_i12.SecurityLocalRepository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i20.RegisterModule {}

class _$IsarRegisterModule extends _i21.IsarRegisterModule {}
