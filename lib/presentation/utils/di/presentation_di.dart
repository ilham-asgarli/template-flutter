import '../../../utils/di/app_di.dart';
import '../config/theme/exapmle_theme.dart';
import '../config/theme/main_theme.dart';
import '../config/theme/theme_interface.dart';
import '../gen/app_localizations.dart';
import '../helpers/theme/theme_helper.dart';

void injectPresentation() {
  getIt.registerLazySingleton<ThemeInterface>(() => MainTheme(),
      instanceName: (MainTheme).toString());
  getIt.registerLazySingleton<ThemeInterface>(() => ExampleTheme(),
      instanceName: (ExampleTheme).toString());
  getIt.registerLazySingleton<ThemeHelper>(() => ThemeHelper());
  getIt.registerLazySingleton<AppLocalizations>(
      () => AppLocalizations.of(getIt()));
}
