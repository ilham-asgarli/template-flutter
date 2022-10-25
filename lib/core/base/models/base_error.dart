import '../../init/network/interfaces/response_model.dart';

class BaseError implements IErrorModel {
  BaseError(this.message);

  @override
  String? message;
}
