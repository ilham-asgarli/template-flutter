import 'client_error.dart';

class ConflictError extends ClientError {
  ConflictError({super.message = "Conflict Error"});
}
