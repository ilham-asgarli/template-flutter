import 'client_error.dart';

class ForbiddenError extends ClientError {
  ForbiddenError({super.message = "Forbidden Error"});
}
