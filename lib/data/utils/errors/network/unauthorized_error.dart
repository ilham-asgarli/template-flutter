import 'client_error.dart';

class UnauthorizedError extends ClientError {
  UnauthorizedError({super.message = "Unauthorized Error"});
}
