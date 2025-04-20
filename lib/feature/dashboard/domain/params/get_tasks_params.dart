import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_tasks_params.freezed.dart';

@freezed
abstract class GetTasksParams with _$GetTasksParams {
  const factory GetTasksParams({
    required String boardId,
    required String columnId,
  }) = _GetTasksParams;
}
