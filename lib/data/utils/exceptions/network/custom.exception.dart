import '../network.exception.dart';

class CustomException extends NetworkException {
  CustomException({super.message = "Custom Network Exception"});
}
