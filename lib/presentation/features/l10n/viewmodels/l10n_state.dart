part of 'l10n_cubit.dart';

class L10nState {
  final Locale? locale;

  const L10nState({
    this.locale = kDebugMode ? const Locale("tr") : null,
  });

  L10nState copyWith({
    Locale? locale,
  }) {
    return L10nState(
      locale: locale ?? this.locale,
    );
  }

  factory L10nState.fromJson(Map<String, dynamic> json) {
    return L10nState(
      locale: json['languageCode'] == null
          ? null
          : Locale(
              json['languageCode'] as String,
              json['countryCode'] as String?,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'languageCode': locale?.languageCode,
      'countryCode': locale?.countryCode,
    };
  }
}
