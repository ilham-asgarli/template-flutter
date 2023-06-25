import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get notFoundNavigation => '403';

  @override
  String get noInternet => 'You don\'t have internet connection.';
}
