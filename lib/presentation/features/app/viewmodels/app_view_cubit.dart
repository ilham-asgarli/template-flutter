import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/utils/di/data_di.dart';
import '../../auth/viewmodels/auth_cubit.dart';

part 'app_view_state.dart';

class AppViewCubit extends Cubit<AppViewState> {
  AppViewCubit() : super(const AppViewState());

  void injectAfterContext(BuildContext context) {
    try {
      injectDataAfterContext(
        context: context,
        authCubit: BlocProvider.of<AuthCubit>(context),
      );
    } catch (_) {}
  }
}
