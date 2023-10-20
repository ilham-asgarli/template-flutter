import '../network.exception.dart';

class TimeoutException extends NetworkException {
  TimeoutException({super.message = "TimeoutException Exception"});
}
