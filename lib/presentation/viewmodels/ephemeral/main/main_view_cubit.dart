import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../domain/usecases/user/get_user.usecase.dart';
import '../../../../utils/di/injectable.dart';

part 'main_view_state.dart';

@lazySingleton
class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(const MainViewState());

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
