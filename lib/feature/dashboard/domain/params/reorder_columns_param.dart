import 'package:freezed_annotation/freezed_annotation.dart';

part 'reorder_columns_param.freezed.dart';

@freezed
abstract class ReorderColumnsParams with _$ReorderColumnsParams {
  const factory ReorderColumnsParams({
    required String boardId,
    required List<String> columnIds,
  }) = _ReorderColumnsParams;
}
