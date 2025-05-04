import '../../../utils/di/app_di.dart';
import '../../features/app/viewmodels/app_view_cubit.dart';
import '../../features/main/viewmodels/main_view_cubit.dart';
import '../config/theme/exapmle_theme.dart';
import '../config/theme/main_theme.dart';
import '../config/theme/theme_interface.dart';
import '../helpers/theme/theme_helper.dart';

void injectPresentation() {
  getIt.registerLazySingleton<ThemeInterface>(() => MainTheme(),
      instanceName: (MainTheme).toString());
  getIt.registerLazySingleton<ThemeInterface>(() => ExampleTheme(),
      instanceName: (ExampleTheme).toString());
  getIt.registerLazySingleton<ThemeHelper>(() => ThemeHelper());

  getIt.registerLazySingleton<AppViewCubit>(() => AppViewCubit());
  getIt.registerLazySingleton<MainViewCubit>(() => MainViewCubit());
}
