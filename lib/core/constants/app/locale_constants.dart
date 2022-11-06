import 'dart:ui';

class LocaleConstants {
  static const path = "assets/translations";

  static const enUS = Locale("en", "US");
  static const trTR = Locale("tr", "TR");
  static const azAZ = Locale("az", "AZ");

  static List<Locale> get supportedLocales => [
        LocaleConstants.azAZ,
        LocaleConstants.trTR,
        LocaleConstants.enUS,
      ];
}
