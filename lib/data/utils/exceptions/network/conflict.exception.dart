import 'client.exception.dart';

class ConflictException extends ClientException {
  ConflictException({super.message = "Conflict Exception"});
}
