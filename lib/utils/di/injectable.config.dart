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
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../../data/datasources/security/local/security.local.datasource.dart'
    as _i13;
import '../../data/datasources/security/remote/security_remote_data_source.dart'
    as _i16;
import '../../data/repositories/security/local/security.local.repository.impl.dart'
    as _i15;
import '../../data/repositories/security/remote/security.remote.repository.impl.dart'
    as _i18;
import '../../domain/repositories/security/local/security.local.repository.dart'
    as _i14;
import '../../domain/repositories/security/remote/security.remote.repository.dart'
    as _i17;
import '../../domain/usecases/security/get_user_use_case.dart' as _i22;
import '../../presentation/features/main/view-models/main_view_model.dart'
    as _i10;
import '../../presentation/features/my-app/state/bloc/network/network_bloc.dart'
    as _i12;
import '../../presentation/features/my-app/state/cubit/theme/theme_cubit.dart'
    as _i20;
import '../../presentation/features/my-app/view-models/my_app_view_model.dart'
    as _i11;
import '../../presentation/utils/config/theme/exapmle_theme.dart' as _i5;
import '../../presentation/utils/config/theme/main_theme.dart' as _i9;
import '../../presentation/utils/helpers/theme/theme_helper.dart' as _i21;
import '../../presentation/utils/managers/isar_manager.dart' as _i7;
import 'isar_register_module.dart' as _i25;
import 'path_provider_register_module.dart' as _i24;
import 'register_module.dart' as _i23;

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
    final pathProviderRegisterModule = _$PathProviderRegisterModule();
    final isarRegisterModule = _$IsarRegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    await gh.lazySingletonAsync<_i4.Directory>(
      () => pathProviderRegisterModule.applicationDocumentsDirectory,
      instanceName: 'applicationDocuments',
      preResolve: true,
    );
    gh.lazySingletonAsync<_i4.Directory>(
      () => pathProviderRegisterModule.temporaryDirectory,
      instanceName: 'temporary',
    );
    gh.lazySingletonAsync<_i4.Directory>(
      () => pathProviderRegisterModule.applicationCacheDirectory,
      instanceName: 'applicationCache',
    );
    gh.lazySingletonAsync<_i4.Directory>(
      () => pathProviderRegisterModule.applicationSupportDirectory,
      instanceName: 'applicationSupport',
    );
    gh.lazySingleton<_i5.ExampleTheme>(() => _i5.ExampleTheme());
    gh.lazySingleton<_i6.Isar>(
      () => isarRegisterModule.users,
      instanceName: 'users',
    );
    gh.lazySingleton<_i7.IsarManager>(() => _i7.IsarManager(
        applicationDocumentsDirectory:
            gh<_i4.Directory>(instanceName: 'applicationDocuments')));
    gh.lazySingleton<_i8.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i9.MainTheme>(() => _i9.MainTheme());
    gh.lazySingleton<_i10.MainViewModel>(() => _i10.MainViewModel());
    gh.lazySingleton<_i11.MyAppViewModel>(() => _i11.MyAppViewModel());
    gh.lazySingleton<_i12.NetworkBloc>(
      () => _i12.NetworkBloc(),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i13.SecurityLocalDataSource>(() =>
        _i13.SecurityLocalDataSource(
            isar: gh<_i6.Isar>(instanceName: 'users')));
    gh.lazySingleton<_i14.SecurityLocalRepository>(() =>
        _i15.SecurityLocalRepositoryImpl(
            securityLocalDataSource: gh<_i13.SecurityLocalDataSource>()));
    gh.lazySingleton<_i16.SecurityRemoteDataSource>(
        () => _i16.SecurityRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i17.SecurityRemoteRepository>(() =>
        _i18.SecurityRemoteRepositoryImpl(
            securityRemoteDataSource: gh<_i16.SecurityRemoteDataSource>()));
    await gh.lazySingletonAsync<_i19.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i20.ThemeCubit>(
      () => _i20.ThemeCubit(),
      dispose: (i) => i.close(),
    );
    gh.singleton<_i21.ThemeHelper>(_i21.ThemeHelper());
    gh.lazySingleton<_i22.GetUserUseCase>(() => _i22.GetUserUseCase(
          securityRemoteRepository: gh<_i17.SecurityRemoteRepository>(),
          securityLocalRepository: gh<_i14.SecurityLocalRepository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i23.RegisterModule {}

class _$PathProviderRegisterModule extends _i24.PathProviderRegisterModule {}

class _$IsarRegisterModule extends _i25.IsarRegisterModule {}
