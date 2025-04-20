import 'package:fire_task/feature/dashboard/domain/entities/board/board_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_model.freezed.dart';
part 'board_model.g.dart';

@freezed
abstract class BoardModel with _$BoardModel {
  const factory BoardModel({
    required String id,
    required String projectId,
    required String name,
    required List<String> columnIds,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BoardModel;

  factory BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);
}

extension BoardModelMapper on BoardModel {
  BoardEntity toEntity() => BoardEntity(
    id: id,
    projectId: projectId,
    name: name,
    columnIds: columnIds,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension BoardEntityMapper on BoardEntity {
  BoardModel toModel() => BoardModel(
    id: id,
    projectId: projectId,
    name: name,
    columnIds: columnIds,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
