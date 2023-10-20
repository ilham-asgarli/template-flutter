import 'client.exception.dart';

class NotFoundException extends ClientException {
  NotFoundException({super.message = "Not Found Network Exception"});
}
