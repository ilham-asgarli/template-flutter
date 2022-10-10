import '../../../generated/locale_keys.g.dart';

class UsernameValidator {
  String? username;

  UsernameValidator(this.username);

  String? validate() {
    if(username != null && username!.isNotEmpty) {
      return null;
    } else {
      return LocaleKeys.emptyUsernameWarning;
    }
  }
}