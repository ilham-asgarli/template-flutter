import 'data.exception.dart';

abstract class NetworkException extends DataException {
  NetworkException({super.message = "Network Exception"});
}
