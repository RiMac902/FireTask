import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_entity.freezed.dart';

@freezed
abstract class BoardEntity with _$BoardEntity {
  const factory BoardEntity({
    required String id,
    required String projectId,
    required String name,
    required List<String> columnIds,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BoardEntity;
}
