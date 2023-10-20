import 'client.exception.dart';

class UnauthorizedException extends ClientException {
  UnauthorizedException({super.message = "Unauthorized Exception"});
}
