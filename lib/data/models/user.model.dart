import 'package:fnv/fnv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../utils/helpers/json-serializable/date_time_converter.dart';

part 'user.model.freezed.dart';
part 'user.model.g.dart';

@Freezed()
@Collection(ignore: {'copyWith'})
class UserModel with _$UserModel {
  const UserModel._();

  @DateTimeConverter()
  const factory UserModel({
    required String id,
    required String email,
    required String password,
    required DateTime createdAt,
  }) = _UserModel;

  Id get isarId => fnv1_64_s(id);

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
