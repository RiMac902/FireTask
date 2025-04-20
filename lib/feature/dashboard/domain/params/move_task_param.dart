import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_task_param.freezed.dart';

@freezed
abstract class MoveTaskParams with _$MoveTaskParams {
  const factory MoveTaskParams({
    required String taskId,
    required String fromColumnId,
    required String toColumnId,
  }) = _MoveTaskParams;
}
