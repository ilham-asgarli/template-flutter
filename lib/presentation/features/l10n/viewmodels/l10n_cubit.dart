import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../utils/gen/app_localizations.dart';

part 'l10n_state.dart';

class L10nCubit extends HydratedCubit<L10nState> {
  L10nCubit() : super(const L10nState());

  void changeLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    emit(state.copyWith(
      locale: locale,
    ));
  }

  @override
  L10nState? fromJson(Map<String, dynamic> json) {
    return L10nState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(L10nState state) {
    return state.toJson();
  }
}
