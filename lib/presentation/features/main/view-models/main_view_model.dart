import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../domain/usecases/security/get_user.usecase.dart';
import '../../../../utils/di/injectable.dart';
import '../../../utils/constants/enums/app_theme_enum.dart';
import '../../my-app/state/cubit/theme/theme_cubit.dart';

@injectable
class MainViewModel {
  void changeTheme() {
    var theme = switch (getIt<ThemeCubit>().state.appTheme) {
      AppTheme.main => AppTheme.example,
      AppTheme.example => AppTheme.main,
    };

    getIt<ThemeCubit>().changeTheme(theme);
  }

  void changeThemeMode() {
    var mode = switch (getIt<ThemeCubit>().state.themeMode) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
    };

    getIt<ThemeCubit>().changeThemeMode(mode);
  }

  void getUser() async {
    var response = await getIt<GetUserUseCase>()(
      const GetUserUseCaseParams(id: "1"),
    );

    response.fold((l) {
      getIt<Logger>().e(l.message);
    }, (r) {
      getIt<Logger>().i(r);
    });
  }
}
