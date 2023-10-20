import 'client.exception.dart';

class BadRequestException extends ClientException {
  BadRequestException({super.message = "Bad Request Exception"});
}
