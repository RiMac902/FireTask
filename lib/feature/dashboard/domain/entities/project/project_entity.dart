import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_entity.freezed.dart';

@freezed
abstract class ProjectEntity with _$ProjectEntity {
  const factory ProjectEntity({
    required String id,
    required String name,
    required String description,
    required DateTime createdAt,
    required String ownerId,
    required Map<String, bool> members,
  }) = _ProjectEntity;
}
