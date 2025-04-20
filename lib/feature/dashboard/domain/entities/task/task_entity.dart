import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entity.freezed.dart';

@freezed
abstract class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String id,
    required String boardId,
    required String columnId,
    required String title,
    required String description,
    required int priority,
    required DateTime dueDate,
    required List<String> assigneeIds,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskEntity;
}
