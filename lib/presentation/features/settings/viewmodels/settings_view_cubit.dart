import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

import '../../../../domain/usecases/user/get_user.usecase.dart';
import '../../../../utils/di/app_di.dart';

part 'settings_view_state.dart';

class SettingsViewCubit extends Cubit<SettingsViewState> {
  SettingsViewCubit() : super(const SettingsViewState());

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
