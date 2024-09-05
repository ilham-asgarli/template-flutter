import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../domain/usecases/user/get_user.usecase.dart';
import '../../utils/di/injectable.dart';

@injectable
class MainViewModel {
  void getUser() async {
    var response = await getIt<GetUserUseCase>()(
      const GetUserUseCaseParams(id: 1),
    );

    response.fold((l) {
      getIt<Logger>().e("${l.runtimeType}: ${l.message}");
    }, (r) {
      getIt<Logger>().i(r);
    });
  }
}
