import 'package:fire_task/feature/tasks/domain/entities/task_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
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
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

extension TaskModelMapper on TaskModel {
  TaskEntity toEntity() => TaskEntity(
    id: id,

    title: title,
    description: description,

    dueDate: dueDate,

    createdAt: createdAt,
    updatedAt: updatedAt,
    status: '',
    assignedTo: '',
    priority: '',
  );
}
