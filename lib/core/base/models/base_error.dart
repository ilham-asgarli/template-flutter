import '../../init/network/interfaces/error_model.dart';

class BaseError implements IErrorModel {
  BaseError(this.message);

  @override
  String? message;
}
