import '../../../utils/di/app_di.dart';
import '../../usecases/auth/login.usecase.dart';
import '../../usecases/auth/register.usecase.dart';
import '../../usecases/user/get_user.usecase.dart';

void injectDomain() {
  // Auth
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(
        authRemoteRepository: getIt(),
      ));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(
        authRemoteRepository: getIt(),
      ));

  // User
  getIt.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(
        userRemoteRepository: getIt(),
        userLocalRepository: getIt(),
      ));
}
