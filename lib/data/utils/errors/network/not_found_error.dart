import 'client_error.dart';

class NotFoundError extends ClientError {
  NotFoundError({super.message = "Not Found Error"});
}
