import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entity.freezed.dart';

@freezed
sealed class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String title,
    required String description,
    required String status,
    required String priority,
    required String assignedTo,
    required DateTime dueDate,
    @Default([]) List<String> tags,
    @Default([]) List<String> attachments,
    @Default(false) bool isCompleted,
  }) = _TaskEntity;
}
