import '../../init/network/IResponseModel.dart';

class BaseError implements IErrorModel {
  BaseError(this.message);

  @override
  String? message;
}
