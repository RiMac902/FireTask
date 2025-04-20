import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_member_param.freezed.dart';

@freezed
abstract class RemoveMemberParams with _$RemoveMemberParams {
  const factory RemoveMemberParams({
    required String projectId,
    required String userId,
  }) = _RemoveMemberParams;
}
