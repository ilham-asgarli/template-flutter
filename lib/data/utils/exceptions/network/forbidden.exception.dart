import 'client.exception.dart';

class ForbiddenException extends ClientException {
  ForbiddenException({super.message = "Forbidden Exception"});
}
