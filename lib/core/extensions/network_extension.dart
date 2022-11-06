import '../constants/enums/http_request_enum.dart';

extension NetworkTypeExtension on HttpTypes? {
  String get rawValue {
    switch (this) {
      case HttpTypes.get:
        return 'GET';
      case HttpTypes.post:
        return 'POST';
      case HttpTypes.put:
        return "PUT";
      case HttpTypes.patch:
        return "PATCH";
      case HttpTypes.delete:
        return "DELETE";
      default:
        throw 'ERROR TYPE';
    }
  }
}
