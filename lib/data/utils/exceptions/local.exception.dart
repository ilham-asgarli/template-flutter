import 'data.exception.dart';

abstract class LocalException extends DataException {
  LocalException({super.message = "Local Exception"});
}
