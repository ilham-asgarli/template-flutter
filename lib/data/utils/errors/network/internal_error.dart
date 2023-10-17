import 'server_error.dart';

class InternalError extends ServerError {
  InternalError({super.message = "Internal Error"});
}
