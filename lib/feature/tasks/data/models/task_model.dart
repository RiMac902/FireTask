import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task_entity.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
sealed class TaskModel with _$TaskModel {
  const TaskModel._();
  const factory TaskModel({
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
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  TaskEntity toEntity() => TaskEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    title: title,
    description: description,
    status: status,
    priority: priority,
    assignedTo: assignedTo,
    dueDate: dueDate,
    tags: tags,
    attachments: attachments,
    isCompleted: isCompleted,
  );

  factory TaskModel.fromEntity(TaskEntity entity) => TaskModel(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    title: entity.title,
    description: entity.description,
    status: entity.status,
    priority: entity.priority,
    assignedTo: entity.assignedTo,
    dueDate: entity.dueDate,
    tags: entity.tags,
    attachments: entity.attachments,
    isCompleted: entity.isCompleted,
  );
}
