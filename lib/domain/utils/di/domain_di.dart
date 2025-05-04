import '../../../utils/di/app_di.dart';
import '../../usecases/user/get_user.usecase.dart';

void injectDomain() {
  // User
  getIt.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(
        userRemoteRepository: getIt(),
        userLocalRepository: getIt(),
      ));
}
