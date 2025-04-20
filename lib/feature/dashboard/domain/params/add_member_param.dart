import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_member_param.freezed.dart';

@freezed
abstract class AddMemberParams with _$AddMemberParams {
  const factory AddMemberParams({
    required String projectId,
    required String userId,
  }) = _AddMemberParams;
}
