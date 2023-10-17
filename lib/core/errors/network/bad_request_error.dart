import 'client_error.dart';

class BadRequestError extends ClientError {
  BadRequestError({super.message = "Bad Request Error"});
}
