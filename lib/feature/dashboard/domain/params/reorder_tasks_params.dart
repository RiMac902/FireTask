import 'package:freezed_annotation/freezed_annotation.dart';

part 'reorder_tasks_params.freezed.dart';

@freezed
abstract class ReorderTasksParams with _$ReorderTasksParams {
  const factory ReorderTasksParams({
    required String columnId,
    required List<String> taskIds,
  }) = _ReorderTasksParams;
}
