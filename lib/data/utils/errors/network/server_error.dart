import 'api_error.dart';

class ServerError extends ApiError {
  ServerError({super.message = "Server Error"});
}
