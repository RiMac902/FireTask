import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_tasks_params.freezed.dart';

@freezed
abstract class WatchTasksParams with _$WatchTasksParams {
  const factory WatchTasksParams({
    required String boardId,
    required String columnId,
  }) = _WatchTasksParams;
}
