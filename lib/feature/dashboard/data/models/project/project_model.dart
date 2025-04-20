import 'package:fire_task/feature/dashboard/domain/entities/project/project_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    required String name,
    required String description,
    required DateTime createdAt,
    required String ownerId,
    required Map<String, bool> members,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

extension ProjectModelMapper on ProjectModel {
  ProjectEntity toEntity() => ProjectEntity(
    id: id,
    name: name,
    description: description,
    createdAt: createdAt,
    ownerId: ownerId,
    members: members,
  );
}

extension ProjectEntityMapper on ProjectEntity {
  ProjectModel toModel() => ProjectModel(
    id: id,
    name: name,
    description: description,
    createdAt: createdAt,
    ownerId: ownerId,
    members: members,
  );
}
